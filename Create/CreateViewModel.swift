//
//  CreateViewModel.swift
//  songcreator
//
//  Created by Sean Meek on 2/25/24.
//

import Foundation
import SwiftUI
import PhotosUI
import Firebase

class CreateViewModel: ObservableObject {
    @Published var isUploading: Bool = false
    @Published var caption: String = ""
    @Published var title: String = ""
    @Published var type: PostType = .demo
    @Published var selectedItem: PhotosPickerItem? {
        didSet {
            Task {
                try await uploadVideo()
            }
        }
    }
    
    @MainActor
    func uploadVideo() async throws {
        isUploading = true
        guard let item = selectedItem else {
            return
        }
        guard let videoData = try await item.loadTransferable(type: Data.self) else {
            return
        }
        
        guard let videoUrl = try await VideoUploader.uploadVideo(withData: videoData) else {
            return
        }
        
        try await Firestore.firestore().collection("posts").document().setData(["videoUrl": videoUrl])
        isUploading = false
    }
}
