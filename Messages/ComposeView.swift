//
//  ComposeView.swift
//  songcreator
//
//  Created by Sean Meek on 2/20/24.
//

import SwiftUI

struct ComposeView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.allUsers) { user in
                NavigationLink(value: user) {
                   UserCellView(user: user)
                }
                .swipeActions {
                    Button(role: .destructive) {
                        print("Deleted")
                    } label: {
                        Label("Delete", systemImage: "trash")
                            .foregroundStyle(.white)
                    }
                    
                    Button {
                        print("blocked")
                    } label: {
                        Label("Block", systemImage: "person.slash")
                    }
                    .tint(.indigo)
                }
            }
            .navigationDestination(for: User.self) { user in
                ConversationView(user: user)
                    .navigationBarBackButtonHidden()
            }
            .refreshable {
                print("Refreshed")
            }
            .padding(.top, 5)
            .listStyle(.plain)
            .navigationTitle("Messages")
            .navigationBarTitleDisplayMode(.inline)
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
                
                ToolbarItem(placement: .principal) {
                    Text("New Message")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    ComposeView()
}
