//
//  MessageService.swift
//  songcreator
//
//  Created by Sean Meek on 2/19/24.
//

import Foundation
import Firebase

@MainActor
struct MessageService {
    static let messageCollection = Firestore.firestore().collection("messages")
    
    static func sendMessage(_ messageText: String, toUser user: User) {
        guard let currentUid = Auth.auth().currentUser?.uid else {
            return
        }
        let chatPartnerId = user.id
        
        let currentUserRef = messageCollection.document(currentUid).collection(chatPartnerId).document()
        let chatPartnerRef = messageCollection.document(chatPartnerId).collection(currentUid)
        let messageId = currentUserRef.documentID
        
        let message = Message(fromId: currentUid,
                              toId: chatPartnerId,
                              messageText: messageText,
                              timestamp: Timestamp(),
                              user: nil,
                              messageId: messageId)
        
        guard let messageData = try? Firestore.Encoder().encode(message) else { return }
        
        currentUserRef.setData(messageData)
        chatPartnerRef.document(messageId).setData(messageData)
    }
    
    static func observeMessages(chatPartner: User, completion: @escaping([Message]) -> Void) {
        guard let currentUid = Auth.auth().currentUser?.uid else {
            return
        }
        let chatPartnerId = chatPartner.id
        
        let query = messageCollection
            .document(currentUid)
            .collection(chatPartnerId)
            .order(by: "timestamp", descending: false)
        
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            let messages = changes.compactMap({ try? $0.document.data(as: Message.self) })
            
            completion(messages)
        }
    }
}
