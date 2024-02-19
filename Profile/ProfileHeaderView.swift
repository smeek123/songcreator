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
                    .fontWeight(.semibold)
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
