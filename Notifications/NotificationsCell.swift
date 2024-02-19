//
//  NotificationsCell.swift
//  songcreator
//
//  Created by Sean Meek on 1/7/24.
//

import SwiftUI

struct NotificationsCell: View {
    var body: some View {
        HStack {
            ProfileImageView(user: User(id: "", username: "", email: ""), size: .small)
            
            HStack {
                Text("sean.meek")
                    .font(.footnote)
                    .fontWeight(.semibold) +
                Text(" ") +
                Text("liked one of your posts.")
                    .font(.footnote) +
                Text(" ") +
                Text("3d")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            .lineLimit(3)
            
            Spacer()
            Rectangle()
                .frame(width: 48,
                   height: 48)
                .clipShape (RoundedRectangle(cornerRadius: 6))
        }
    }
}

#Preview {
    NotificationsCell()
}
