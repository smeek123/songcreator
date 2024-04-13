//
//  LoginViewModel.swift
//  songcreator
//
//  Created by Sean Meek on 2/18/24.
//

import Foundation

@MainActor
class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await UserAuthService.shared.loginWithEmail(with: email, password: password)
        
        email = ""
        password = ""
    }
}
