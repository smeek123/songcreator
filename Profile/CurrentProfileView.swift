//
//  CurrentProfileView.swift
//  songcreator
//
//  Created by Sean Meek on 1/1/24.
//

import SwiftUI

struct CurrentProfileView: View {
    @State var showSignOut: Bool = false
    @State private var selection: Int = 0
    @Namespace private var pickerTabs
    @State var currentUser: User? = nil
    let user: User
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    //Profile info
                    ProfileHeaderView(user: user)
                    
                    //Actions
                    NavigationLink {
                        EditProfileView(user: user)
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Edit Profile")
                            .fontWeight(.semibold)
                            .frame(width: UIScreen.main.bounds.width * 0.85, height: 32)
                    }
                    .buttonStyle(.bordered)
                    .padding(.top, 5)
                    
                    //Toolbar
                    HStack {
                        Spacer()
                        
                        Button {
                            withAnimation(.linear) {
                                selection = 0
                            }
                        } label: {
                            ZStack {
                                if selection == 0 {
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundStyle(.purple)
                                        .matchedGeometryEffect(id: "tabs", in: pickerTabs)
                                } else {
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundStyle(Color(UIColor.secondarySystemBackground))
                                }
                                
                                Image(systemName: "rectangle.grid.3x2.fill")
                                    .font(.system(size: 22))
                                    .padding(10)
                                    .padding(.horizontal, 10)
                            }
                        }
                        
                        Spacer()
                        
                        Button {
                            withAnimation(.linear) {
                                selection = 1
                            }
                        } label: {
                            ZStack {
                                if selection == 1 {
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundStyle(.purple)
                                        .matchedGeometryEffect(id: "tabs", in: pickerTabs)
                                } else {
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundColor(Color(UIColor.secondarySystemBackground))
                                }
                                
                                Image(systemName: "folder.fill")
                                    .font(.system(size: 22))
                                    .padding(10)
                                    .padding(.horizontal, 10)
                            }
                        }
                        
                        Spacer()
                        
                        Button {
                            withAnimation(.linear) {
                                selection = 2
                            }
                        } label: {
                            ZStack {
                                if selection == 2 {
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundStyle(.purple)
                                        .matchedGeometryEffect(id: "tabs", in: pickerTabs)
                                } else {
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundColor(Color(UIColor.secondarySystemBackground))
                                }
                                
                                Image(systemName: "bookmark.fill")
                                    .font(.system(size: 22))
                                    .padding(10)
                                    .padding(.horizontal, 10)
                            }
                        }
                        
                        Spacer()
                    }
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
                    
                    //Posts
                    PostGridView()
                        .padding(.vertical)
                }
                .padding(.top)
                .confirmationDialog("Sign Out?", isPresented: $showSignOut, titleVisibility: .visible) {
                    //cancels the action
                    Button(role: .cancel) {
                        print("canceled")
                    } label: {
                        Text("cancel")
                    }
                    
                    //calls the logout method and deletes the access token and account.
                    Button(role: .destructive) {
                        UserAuthService.shared.signout()
                    } label: {
                        Text("Sign Out")
                    }
                }
            }
            .navigationTitle(user.name ?? "Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button {
                        
                    } label: {
                        Label("Settings", systemImage: "gearshape")
                    }
                }
                
                ToolbarItem {
                    Button {
                        showSignOut.toggle()
                    } label: {
                        Label("Log Out", systemImage: "rectangle.portrait.and.arrow.right")
                    }
                }
            }
            .accentColor(.primary)
        }
    }
}

#Preview {
    CurrentProfileView(user: User(id: "", username: "", email: ""))
}
