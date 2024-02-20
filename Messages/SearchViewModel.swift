//
//  SearchViewModel.swift
//  songcreator
//
//  Created by Sean Meek on 2/20/24.
//

import Foundation
import FirebaseFirestore
import Combine

@MainActor
class SearchViewModel: ObservableObject {
    @Published var allUsers: [User] = []
    @Published var filteredUsers: [User] = []
    @Published var searchText: String = ""
    private var cancellables = Set<AnyCancellable>()
    var isSearching: Bool {
        !searchText.isEmpty
    }
    
    init() {
        addSubscribers()
        Task {
            try await fetchAllUsers()
        }
    }
    
    private func addSubscribers() {
        $searchText
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .sink { [weak self] searchText in
                self?.filterUsers(for: searchText)
            }
            .store(in: &cancellables)
    }
    
    func fetchAllUsers() async throws {
        self.allUsers = try await UserService.fetchAllUsers()
    }
    
    func filterUsers(for text: String) {
        guard !text.isEmpty else {
            return
        }
        
        let search = text.lowercased()
        Firestore.firestore().collection("users").whereField("searchTerms", arrayContains: search).getDocuments { querySnapshot, error in
            guard let documents = querySnapshot?.documents, error == nil else {
                return
            }
            self.filteredUsers = documents.compactMap({ try? $0.data(as: User.self) })
        }
    }
}
