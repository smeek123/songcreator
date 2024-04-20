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
    @Environment(\.dismiss) var dismiss
    @State private var player = AVPlayer()
    let url: URL
    
    var body: some View {
        ZStack {
            CustomVideoPlayer(player: player)
                .containerRelativeFrame([.horizontal, .vertical])
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        viewmodel.selectedItem = nil
                        
                        dismiss()
                    } label: {
                        Text("Go Back")
                            .foregroundStyle(.primary)
                            .padding()
                            .padding(.horizontal)
                            .frame(width: UIScreen.main.bounds.width * 0.45)
                            .font(.title3)
                            .bold()
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color(uiColor: .secondarySystemBackground)))
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Select")
                            .foregroundStyle(.primary)
                            .padding()
                            .padding(.horizontal)
                            .frame(width: UIScreen.main.bounds.width * 0.45)
                            .font(.title3)
                            .bold()
                            .background(RoundedRectangle(cornerRadius: 20).fill(.purple))
                    }
                    
                    Spacer()
                }
                .padding(.bottom)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .tint(.primary)
        .onAppear {
            player.replaceCurrentItem(with: AVPlayerItem(url: url))
            player.play()
        }
        .onTapGesture {
            switch player.timeControlStatus {
            case .paused:
                player.play()
            case .waitingToPlayAtSpecifiedRate:
                break
            case .playing:
                player.pause()
            @unknown default:
                break
            }
        }
    }
}

//#Preview {
//    VideoPreview()
//}
