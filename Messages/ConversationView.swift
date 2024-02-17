//
//  ConversationView.swift
//  songcreator
//
//  Created by Sean Meek on 2/17/24.
//

import SwiftUI

struct ConversationView: View {
    @Environment(\.dismiss) var dismiss
    @State private var messageText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    VStack {
                        ProfileImageView(size: .xLarge)
                        
                        VStack(spacing: 4) {
                            Text("username")
                                .font(.title3)
                                .fontWeight(.semibold)
                            
                            Text("Message")
                                .font(.footnote)
                                .foregroundStyle(.purple)
                        }
                    }
                }
                
                ZStack(alignment: .trailing) {
                    TextField("Message...", text: $messageText, axis: .vertical)
                        .padding(12)
                        .padding(.trailing, 48)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .font(.subheadline)
                        .background(Color(.secondarySystemBackground))
                    
                    Button {
                        
                    } label: {
                        Text("Send")
                            .foregroundStyle(!messageText.isEmpty ? .purple : .secondary)
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
                    Text("Username")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    ConversationView()
}
