//
//  ChatCellview.swift
//  songcreator
//
//  Created by Sean Meek on 2/19/24.
//

import SwiftUI

struct ChatCellview: View {
    let isFromCurrentUser: Bool
    
    var body: some View {
        HStack {
            if isFromCurrentUser {
                Spacer()
                
                Text("TEST MESSAGETEST MESSAGETEST MESSAGETEST MESSAGETEST MESSAGETEST MESSAGETEST")
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding()
                    .background(Color(.purple))
                    .clipShape(ChatShape(isFromCurrentUser: isFromCurrentUser))
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.5, alignment: .trailing)
            } else {
                Text("TEST MESSAGE")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding()
                    .background(Color(uiColor: .quaternaryLabel))
                    .clipShape(ChatShape(isFromCurrentUser: isFromCurrentUser))
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.5, alignment: .leading)
                
                Spacer()
            }
        }
        .padding(.horizontal, 8)
    }
}

#Preview {
    ChatCellview(isFromCurrentUser: false)
}
