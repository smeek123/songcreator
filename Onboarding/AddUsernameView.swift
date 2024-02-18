//
//  AddUsernameView.swift
//  songcreator
//
//  Created by Sean Meek on 2/18/24.
//

import SwiftUI

struct AddUsernameView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    @State private var isActive: Bool = false
    @State private var readyToNavigate: Bool = false
    
    var body: some View {
        VStack(spacing: 25) {
            Spacer()
            
            Text("Create a username")
                .foregroundColor(.primary)
                .font(.title)
                .multilineTextAlignment(.center)
            
            Text("Your username must be at least 3 characters long.")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .font(.headline)
            
            TextField("Enter username", text: $viewModel.username)
                .modifier(TextFieldModifier())
                .autocapitalization(.none)
                .autocorrectionDisabled()
                .onChange(of: viewModel.username, initial: true) {
                    if viewModel.username.count >= 3 {
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
            
            Text("3/4")
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
//        .navigationDestination(isPresented: $readyToNavigate) {
//            AddStreamingView()
//                .navigationBarBackButtonHidden()
//        }
    }
}


#Preview {
    AddUsernameView()
}
