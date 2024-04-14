//
//  CustomVideoPlayer.swift
//  songcreator
//
//  Created by Sean Meek on 2/17/24.
//

import Foundation
import SwiftUI
import AVKit

struct CustomVideoPlayer: UIViewControllerRepresentable {
    var player: AVPlayer
    
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        controller.exitsFullScreenWhenPlaybackEnds = false
        controller.allowsPictureInPicturePlayback = true
        controller.videoGravity = .resizeAspectFill
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}
