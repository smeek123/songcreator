//
//  VideoPreview.swift
//  songcreator
//
//  Created by Sean Meek on 3/16/24.
//

import SwiftUI
import AVKit

struct VideoPreview: View {
    @StateObject var viewmodel = CreateViewModel()
    
    var body: some View {
        ZStack {
            CustomVideoPlayer(player: AVPlayer(url: viewmodel.videoURL ?? URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4")!))
                .containerRelativeFrame([.horizontal, .vertical])
        }
    }
}

//#Preview {
//    VideoPreview()
//}
