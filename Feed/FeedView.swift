//
//  FeedView.swift
//  songcreator
//
//  Created by Sean Meek on 12/31/23.
//

import SwiftUI
import AVKit

struct FeedView: View {
    @State private var scrollPosition: String?
    @State private var selection: Int = 0
    @Namespace private var pickerTabs
    @StateObject var viewModel = FeedViewModel()
    @State private var player = AVPlayer()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(viewModel.posts) { post in
                        FeedCell(post: post, player: player)
                            .id(post.id)
                            .onAppear {
                                playInitialVideoIfNecessary()
                            }
                    }
                }
                .scrollTargetLayout()
            }
            .onAppear {
                player.play()
            }
            .onDisappear {
                player.pause()
            }
            .scrollPosition(id: $scrollPosition)
            .scrollTargetBehavior(.paging)
            .ignoresSafeArea()
            .onChange(of: scrollPosition) { oldValue, newValue in
                playVideoOnChangeOfScrollPosition(postId: newValue)
            }
            .overlay {
                VStack {
                    HStack(alignment: .center, spacing: 18) {
                        Button {
                            withAnimation(.linear) {
                                selection = 1
                            }
                        } label: {
                            Text("Songs")
                                .font(.system(size: 18))
                                .fontWeight(selection == 1 ? .bold : .semibold)
                                .foregroundStyle(selection == 1 ? .purple : .white)
                        }
                        
                        Button {
                            withAnimation(.linear) {
                                selection = 0
                            }
                        } label: {
                            Text("Demos")
                                .font(.system(size: 18))
                                .fontWeight(selection == 0 ? .bold : .semibold)
                                .foregroundStyle(selection == 0 ? .purple : .white)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 35, alignment: .top)
                    .background(Color(.black).opacity(0.15))
                    
                    Spacer()
                }
            }
        }
    }
    
    func playVideoOnChangeOfScrollPosition(postId: String?) {
        guard let currentPost = viewModel.posts.first(where: { $0.id == postId }) else {
            return
        }
        
        player.replaceCurrentItem(with: nil)
        if let url = URL(string: currentPost.videoUrl) {
            let playerItem = AVPlayerItem(url: url)
            player.replaceCurrentItem(with: playerItem)
        }
    }
    
    func playInitialVideoIfNecessary() {
        guard scrollPosition == nil, let post = viewModel.posts.first, player.currentItem == nil else {
            return
        }
        
        if let url = URL(string: post.videoUrl) {
            let item = AVPlayerItem(url: url)
            player.replaceCurrentItem(with: item)
        }
    }
}

#Preview {
    NavigationStack {
        FeedView()
            .tint(.white)
    }
}
