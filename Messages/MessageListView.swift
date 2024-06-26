//
//  MessageListView.swift
//  songcreator
//
//  Created by Sean Meek on 2/17/24.
//

import SwiftUI

struct MessageListView: View {
    @StateObject var viewModel = MessageListViewModel()
    @State private var showCompose: Bool = false
    
    var body: some View {
        List(viewModel.users) { user in
            NavigationLink(value: user) {
                MessageCellView(user: user)
                    .fullScreenCover(isPresented: $showCompose) {
                        ComposeView()
                    }
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
            ToolbarItem {
                Button {
                    showCompose.toggle()
                } label: {
                    Label("compose", systemImage: "square.and.pencil")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MessageListView()
    }
}
