//
//  AddPasswordView.swift
//  songcreator
//
//  Created by Sean Meek on 2/18/24.
//

import SwiftUI

struct AddPasswordView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    @State private var isActive: Bool = false
    @State private var readyToNavigate: Bool = false
    
    var body: some View {
        VStack(spacing: 25) {
            Spacer()
            
            Text("Create a password")
                .foregroundColor(.primary)
                .font(.title)
                .multilineTextAlignment(.center)
            
            Text("Your password must be at least 8 characters long.")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .font(.headline)
            
            SecureField("Enter password", text: $viewModel.password)
                .modifier(TextFieldModifier())
                .onChange(of: viewModel.password, initial: true) {
                    if viewModel.password.count >= 8 {
                        isActive = true
                    } else {
                        isActive = false
                    }
                }
            
            Button {
                if isActive {
                    readyToNavigate.toggle()
                }
            } label: {
                LargeButtonView(title: "Next", isActive: isActive)
            }
            .disabled(!isActive)

            Spacer()
            
            Text("2/3")
                .foregroundColor(.secondary)
                .font(.footnote)
                .fontWeight(.semibold)
                .padding(.vertical)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.primary)
                        .font(.system(size: 20))
                }
            }
        }
        .navigationDestination(isPresented: $readyToNavigate) {
            AddUsernameView()
                .navigationBarBackButtonHidden()
        }
    }
}

//#Preview {
//    NavigationStack {
//        AddPasswordView()
//    }
//}
