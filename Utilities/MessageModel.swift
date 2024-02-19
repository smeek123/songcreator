//
//  MessageModel.swift
//  songcreator
//
//  Created by Sean Meek on 2/19/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Message: Identifiable, Codable, Hashable {
    let fromId: String
    let toId: String
    let messageText: String
    let timestamp: Timestamp
    let user: User?
    @DocumentID var messageId: String?
    var id: String {
        return messageId ?? NSUUID().uuidString
    }
    var chatPartnerId: String {
        return fromId == Auth.auth().currentUser?.uid ? toId : fromId
    }
    var isFromCurrentUser: Bool {
        return fromId == Auth.auth().currentUser?.uid
    }
}
