//
//  UserCellView.swift
//  songcreator
//
//  Created by Sean Meek on 2/20/24.
//

import SwiftUI

struct UserCellView: View {
    let user: User
    
    var body: some View {
        HStack {
            ProfileImageView(user: user, size: .small)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(user.username)
                        .font(.footnote)
                        .bold()
                    if let name = user.name {
                        Text(name)
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                            .fontWeight(.semibold)
                    }
                }
            }
            
            Spacer()
        }
    }
}

//#Preview {
//    UserCellView()
//}
