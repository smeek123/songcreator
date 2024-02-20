//
//  ConversationView.swift
//  songcreator
//
//  Created by Sean Meek on 2/17/24.
//

import SwiftUI

struct ConversationView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: ChatViewModel
    let user: User
    
    init(user: User) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: ChatViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ProfileImageView(user: user, size: .xLarge)
                    
                    VStack(spacing: 4) {
                        Text(user.username)
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Message")
                            .font(.footnote)
                            .foregroundStyle(.purple)
                    }
                }
                
                ForEach(0..<15) { _ in
                    ChatCellview(isFromCurrentUser: Bool.random())
                }
            }
            .padding(.top)
            
            ZStack(alignment: .trailing) {
                TextField("Message...", text: $viewModel.messageText, axis: .vertical)
                    .padding(12)
                    .padding(.trailing, 48)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .font(.subheadline)
                    .background(Color(.secondarySystemBackground))
                
                Button {
                    viewModel.sendMessage()
                    viewModel.messageText = ""
                } label: {
                    Text("Send")
                        .foregroundStyle(!viewModel.messageText.isEmpty ? .purple : .secondary)
                        .fontWeight(.semibold)
                }
            }
            .padding()
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
            
            ToolbarItem(placement: .principal) {
                Text(user.name ?? user.username)
                    .font(.title3)
                    .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    ConversationView(user: User(id: "", username: "", email: ""))
}
