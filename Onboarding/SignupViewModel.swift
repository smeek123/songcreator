//
//  SignupViewModel.swift
//  songcreator
//
//  Created by Sean Meek on 2/18/24.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
//    func createUser() async throws {
//        try await UserAuthService.shared.createUser(email: email, password: password, username: username)
//        
//        await MainActor.run {
//            email = ""
//            password = ""
//            username = ""
//        }
//    }
}
