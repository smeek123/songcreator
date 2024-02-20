//
//  ChatCellview.swift
//  songcreator
//
//  Created by Sean Meek on 2/19/24.
//

import SwiftUI

struct ChatCellview: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.isFromCurrentUser {
                Spacer()
                
                Text(message.messageText)
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding()
                    .background(Color(.purple))
                    .clipShape(ChatShape(isFromCurrentUser: message.isFromCurrentUser))
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.5, alignment: .trailing)
            } else {
                Text(message.messageText)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding()
                    .background(Color(uiColor: .quaternaryLabel))
                    .clipShape(ChatShape(isFromCurrentUser: message.isFromCurrentUser))
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.5, alignment: .leading)
                
                Spacer()
            }
        }
        .padding(.horizontal, 8)
    }
}

//#Preview {
//    ChatCellview(isFromCurrentUser: false)
//}
