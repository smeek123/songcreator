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
            ProfileImageView(size: .xSmall)
            
            HStack {
                Text("sean.meek")
                    .font(.footnote)
                    .fontWeight(.semibold) +
                Text(" liked one of your posts.")
                    .font(.footnote) +
                Text(" 3d")
                    .font (.caption)
                    .foregroundStyle(.gray)
            }
            
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
