//
//  ProfileHeaderView.swift
//  songcreator
//
//  Created by Sean Meek on 1/1/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 8) {
                ProfileImageView(user: user, size: .large)
                
                Text(user.username)
                    .font(.subheadline)
                    .bold()
                
                if let bio = user.bio {
                    Text(bio)
                        .lineLimit(4)
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .frame(width: 300)
                }
            }
            
            HStack(spacing: 16) {
                UserStatView(value: 12, title: "Following")
                UserStatView(value: 10, title: "Follower")
                UserStatView(value: 5, title: "Project")
            }
        }
    }
}

#Preview {
    ProfileHeaderView(user: User(id: "", username: "", email: ""))
}
