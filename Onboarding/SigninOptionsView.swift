//
//  SigninOptionsView.swift
//  songcreator
//
//  Created by Sean Meek on 2/18/24.
//

import SwiftUI

struct SignInOptionsView: View {
    @EnvironmentObject var viewModel: RegistrationViewModel
    @StateObject var loginViewModel = LoginViewModel()
    @State private var isActive: Bool = false
    @State private var readyToNavigate: Bool = false
    
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Text("JamaGram")
                    .foregroundColor(.primary)
                    .font(.largeTitle)
                    .padding(.vertical)
                
                Text("Welcome to JamaGram! The best place to find other artists to collaborate with.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.headline)
                
                VStack(spacing: 25) {
                    TextField("Enter your email address", text: $loginViewModel.email)
                        .modifier(TextFieldModifier())
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                    
                    SecureField("Enter your password", text: $loginViewModel.password)
                        .modifier(TextFieldModifier())
                    
                    Button {
                        print("Show forgot password")
                    } label: {
                        Text("Forgot Password?")
                            .foregroundStyle(.purple)
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .padding(.top)
                            .padding(.trailing, 10)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    
                    Button {
                        Task {
                            if !loginViewModel.email.isEmpty && !loginViewModel.password.isEmpty {
                                try await loginViewModel.signIn()
                            }
                        }
                    } label: {
                        LargeButtonView(title: "Log In", isActive: !loginViewModel.email.isEmpty && loginViewModel.password.count >= 8)
                    }
                    .disabled(loginViewModel.email.isEmpty || loginViewModel.password.count < 8)
                    
                    HStack {
                        Rectangle()
                            .frame(width: (UIScreen.main.bounds.width / 2)-40, height: 1)
                        
                        Text("OR")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Rectangle()
                            .frame(width: (UIScreen.main.bounds.width / 2)-40, height: 1)
                    }
                    .padding(.vertical, 8)
                    .foregroundStyle(.secondary)
                    
                    Text("Continue with Apple")
                        .foregroundStyle(.primary)
                        .fontWeight(.semibold)
                        .font(.footnote)
                }
                
                Spacer()
                
                NavigationLink {
                    AddEmailView()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Don't have an account? Sign up now!")
                        .foregroundStyle(.purple)
                        .padding(.vertical)
                        .font(.footnote)
                }
            }
            .padding(.vertical)
            .padding(.horizontal, 18)
        }
    }
}


#Preview {
    SignInOptionsView()
}
