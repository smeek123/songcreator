//
//  MessageListViewModel.swift
//  songcreator
//
//  Created by Sean Meek on 2/19/24.
//

import Foundation
import Firebase

@MainActor
class MessageListViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task {
            try await fetchUsers()
        }
    }
    
    func fetchUsers() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else {
            return
        }
        let users = try await UserService.fetchAllUsers()
        self.users = users.filter({ $0.id != currentUid })
    }
    
    
}
