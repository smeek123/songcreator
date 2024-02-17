//
//  CurrentProfileView.swift
//  songcreator
//
//  Created by Sean Meek on 1/1/24.
//

import SwiftUI

struct CurrentProfileView: View {
       @State private var selection: Int = 0
       @Namespace private var pickerTabs
          
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    //Profile info
                    ProfileHeaderView()
                    
                    //Actions
                    NavigationLink {
                        Text("Customize")
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
                                
                                Image(systemName: "headphones")
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
                    .clipShape(Capsule())
                    .padding()
                    
                    //Posts
                    PostGridView()
                        .padding(.vertical)
                }
                .padding(.top)
            }
            .navigationTitle("Profile")
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
    CurrentProfileView()
}
