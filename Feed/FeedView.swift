//
//  FeedView.swift
//  songcreator
//
//  Created by Sean Meek on 12/31/23.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(0..<10) { post in
                    Rectangle()
                        .fill(.blue)
                        .containerRelativeFrame([.horizontal, .vertical])
                        .overlay {
                        Text("Post \(post)")
                                .foregroundStyle(.white)
                                .font(.largeTitle)
                    }
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
    }
}

#Preview {
    FeedView()
}
