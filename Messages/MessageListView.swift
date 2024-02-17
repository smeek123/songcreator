//
//  MessageListView.swift
//  songcreator
//
//  Created by Sean Meek on 2/17/24.
//

import SwiftUI

struct MessageListView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<35) { notification in
                    MessageCellView()
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
            }
            .refreshable {
                print("Refreshed")
            }
            .padding(.top, 5)
            .listStyle(.plain)
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    MessageListView()
}
