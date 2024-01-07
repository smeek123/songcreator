//
//  PostGridView.swift
//  songcreator
//
//  Created by Sean Meek on 1/1/24.
//

import SwiftUI

struct PostGridView: View {
    private let items = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 2) {
            ForEach(0..<25) { post in
                Rectangle()
                    .frame(width: (UIScreen.main.bounds.width / 3) - 2, height: 180)
                    .clipped()
            }
        }
    }
}

#Preview {
    PostGridView()
}
