//
//  FeedViewModel.swift
//  songcreator
//
//  Created by Sean Meek on 2/17/24.
//

import Foundation

@MainActor
class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    let videoUrls = [
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"
    ]
    
    init() {
//        fetchPosts()
    }
    
//    func fetchPosts() {
//        self.posts = [
//            .init(id: NSUUID().uuidString, videoUrl: videoUrls[0]),
//            .init(id: NSUUID().uuidString, videoUrl: videoUrls[1]),
//            .init(id: NSUUID().uuidString, videoUrl: videoUrls[2]),
//            .init(id: NSUUID().uuidString, videoUrl: videoUrls[3]),
//            .init(id: NSUUID().uuidString, videoUrl: videoUrls[4]),
//        ]
//    }
}
