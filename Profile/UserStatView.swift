//
//  UserStatView.swift
//  songcreator
//
//  Created by Sean Meek on 1/1/24.
//

import SwiftUI

struct UserStatView: View {
    let value: Int
    let title: String
    
    var body: some View {
        VStack {
            Text(String(value))
                .font(.subheadline)
                .fontWeight(.bold)
            
            Text(title)
                .font(.subheadline)
                .fontWeight(.bold)
        }
        .frame(width: 80, alignment: .center)
    }
}

#Preview {
    UserStatView(value: 20, title: "fans")
}
