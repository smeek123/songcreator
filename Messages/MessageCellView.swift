//
//  MessageCellView.swift
//  songcreator
//
//  Created by Sean Meek on 2/17/24.
//

import SwiftUI

struct MessageCellView: View {
    var body: some View {
        HStack {
            ProfileImageView(size: .small)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("sean.meek")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Text("Thank you for your input on my new track. I hope to release it soon. Would you be willing to help produce it?")
                        .lineLimit(2)
                        .font(.footnote)
                }
            }
            
            Spacer()
            
            Text("3d ago")
                .font(.caption)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    MessageCellView()
}
