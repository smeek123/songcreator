//
//  LoginView.swift
//  songcreator
//
//  Created by Sean Meek on 2/18/24.
//

import SwiftUI

struct LoginView: View {
//    @StateObject var loginViewModel = LoginViewModel()
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isActive: Bool = false
    @State private var readyToNavigate: Bool = false
    
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    var body: some View {
        VStack(spacing: 25) {
            Spacer()
            
            TextField("Enter your email address", text: $email)
                .modifier(TextFieldModifier())
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
            
            SecureField("Enter your password", text: $password)
                .modifier(TextFieldModifier())
            
            Button {
//                Task {
//                    if !loginViewModel.email.isEmpty && !loginViewModel.password.isEmpty {
//                        try await loginViewModel.signIn()
//                    }
//                }
            } label: {
                LargeButtonView(title: "Log In", isActive: true)
                
//                LargeButtonView(title: "Log In", isActive: !loginViewModel.email.isEmpty && loginViewModel.password.count >= 8)
            }
//            .disabled(loginViewModel.email.isEmpty || loginViewModel.password.count < 8)
            
            Spacer()
            
            NavigationLink {
                Text("Reset")
                    .navigationBarBackButtonHidden()
            } label: {
                Text("Forgot password")
                    .foregroundColor(Color("MainColor"))
                    .padding(.vertical)
                    .font(.footnote)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.primary)
                        .font(.system(size: 20))
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
