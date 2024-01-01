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
                    
                    Button {
                        
                    } label: {
                        Text("Edit Profile")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 360, height: 32)
                            .background (Color(.systemGray3))
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                    }
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
