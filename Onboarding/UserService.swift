//
//  UserService.swift
//  songcreator
//
//  Created by Sean Meek on 2/18/24.
//

import Foundation
import FirebaseFirestore

struct UserService {
    static func fetchUser(uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
    
    static func addUserListener(uid: String, completion: @escaping (_ user: User) -> Void) {
        Firestore.firestore().collection("users").document(uid).addSnapshotListener { querySnapshot, error in
            guard let document = querySnapshot else {
                return
            }
            
            let user = try? document.data(as: User.self)
            completion(user ?? User(id: "Id", username: "", email: ""))
        }
    }
    
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
    }
}
