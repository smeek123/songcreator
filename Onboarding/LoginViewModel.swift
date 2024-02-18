//
//  LoginViewModel.swift
//  songcreator
//
//  Created by Sean Meek on 2/18/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
//    func signIn() async throws {
//        try await UserAuthService.shared.loginWithEmail(with: email, password: password)
//        
//        await MainActor.run {
//            email = ""
//            password = ""
//        }
//    }
}
