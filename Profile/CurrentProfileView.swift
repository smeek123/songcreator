//
//  CurrentProfileView.swift
//  songcreator
//
//  Created by Sean Meek on 1/1/24.
//

import SwiftUI

struct CurrentProfileView: View {    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ProfileHeaderView()
                    
                    NavigationLink {
                        Text("Customize")
                    } label: {
                        Text("Edit Profile")
                            .fontWeight(.semibold)
                            .frame(width: UIScreen.main.bounds.width * 0.85, height: 32)
                    }
                    .buttonStyle(.bordered)
                    .padding(.top, 5)

                    PostGridView()
                        .padding(.vertical)
                }
                .padding(.top)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CurrentProfileView()
}
