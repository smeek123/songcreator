//
//  EditProfileview.swift
//  songcreator
//
//  Created by Sean Meek on 2/19/24.
//

import SwiftUI
import PhotosUI
import FirebaseFirestore

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: EditProfileViewModel
    @State private var isLoading: Bool = false
    @State private var showError: Bool = false
    let user: User
    
    init(user: User) {
        self.user = user
        
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.primary)
                            .font(.system(size: 20))
                    }
                    
                    Spacer()
                    
                    Text("Edit Profile")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Button {
                        if viewModel.bio.count <= 200 && viewModel.username.count >= 3 && viewModel.username.count <= 30 && viewModel.name.count <= 40 {
                            isLoading = true
                            
                            Task {
                                try await viewModel.updateUserData()
                            }
                            
                            isLoading = false
                            
                            dismiss()
                        } else {
                            showError = true
                        }
                    } label: {
                        if isLoading {
                            ProgressView()
                                .foregroundStyle(.purple)
                        } else {
                            Image(systemName: "checkmark")
                                .foregroundStyle(.primary)
                                .font(.system(size: 20))
                        }
                    }
                }
                .padding(.horizontal)
                .padding()
                .alert("Check to make sure your bio and username are the right length.", isPresented: $showError) {
                    Button("OK", role: .cancel) {
                        
                    }
                }
                
                Divider()
                    .overlay(Color(.purple))
                    .padding(.vertical, 10)
                
                VStack(spacing: 15) {
                    PhotosPicker(selection: $viewModel.selectedImage, matching: .images) {
                        if let image = viewModel.profileImage {
                            image
                                .resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                        } else {
                            ProfileImageView(user: user, size: .xLarge)
                        }
                    }
                    
                    Section(header: HStack {
                        Text("Name")
                            .foregroundStyle(.secondary)
                        
                        Spacer()
                    }) {
                        TextField("Enter your name", text: $viewModel.name)
                            .modifier(TextFieldModifier())
                    }
                    
                    Section(header: HStack {
                        Text("Username")
                            .foregroundColor(.secondary)
                        
                        Spacer()
                    }, footer: HStack {
                        Text("Username must be between 3 and 30 characters")
                            .padding(.horizontal)
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        
                        Spacer()
                    }) {
                        TextField("Change your username", text: $viewModel.username)
                            .modifier(TextFieldModifier())
                            .autocorrectionDisabled()
                            .autocapitalization(.none)
                    }
                    
                    Section(header: HStack {
                        Text("Bio")
                            .foregroundColor(.secondary)
                        
                        Spacer()
                        
                        Text("\(viewModel.bio.count)/200")
                            .padding(.horizontal)
                            .foregroundColor(viewModel.bio.count > 200 ? .red : .secondary)
                            .font(.footnote)
                    }) {
                        TextField("Add a Bio", text: $viewModel.bio, axis: .vertical)
                            .modifier(TextFieldModifier())
                            .lineLimit(5)
                    }
                }
                .padding()
                
                Spacer()
            }
            .overlay {
                if isLoading {
                    ProgressView()
                        .foregroundColor(Color("MainColor"))
                }
            }
        }
    }
}

#Preview {
    EditProfileView(user: User(id: "", username: "", email: ""))
}
