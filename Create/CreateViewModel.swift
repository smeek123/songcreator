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
import CoreTransferable
import AVKit

class CreateViewModel: ObservableObject {
    @Published var isUploading: Bool = false
    @Published var caption: String = ""
    @Published var title: String = ""
    @Published var type: PostType = .demo
    @Published var showVideo: Bool = false
    @Published var videoURL: URL? = nil
    
    @MainActor
    @Published var selectedItem: PhotosPickerItem? {
        didSet {
            getURL()
        }
    }
    
    @MainActor
    func getDocumentsDirectory() -> URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        // just send back the first one, which ought to be the only one
        return paths[0]
    }
    
    @MainActor
    func getURL() {
        guard let item = selectedItem else {
            return
        }
        
        Task {
            if let data = try? await item.loadTransferable(type: Data.self) {
                if let contentType = item.supportedContentTypes.first {
                    // Step 2: make the URL file name and get a file extention.
                    let url = self.getDocumentsDirectory().appendingPathComponent("\(UUID().uuidString).\(contentType.preferredFilenameExtension ?? "")")
                    print(url)
                    do {
                        // Step 3: write to temp App file directory and return in completionHandler
                        try data.write(to: url)
                        self.videoURL = url
                        self.showVideo.toggle()
                    } catch {
                        self.videoURL = nil
                    }
                }
            } else {
                self.videoURL = nil
            }
        }
    }
    
//    func uploadVideo() async throws {
//        var uploadCaption: String? = caption
//        var uploadTitle: String? = title
//        
//        await MainActor.run {
//            isUploading = true
//        }
//        
//        guard let item = await selectedItem else {
//            return
//        }
//        
//        guard let videoData = try await item.loadTransferable(type: Data.self) else {
//            return
//        }
//        
//        guard let uid = Auth.auth().currentUser?.uid else {
//            return
//        }
//        
//        guard let videoUrl = try await VideoUploader.uploadVideo(withData: videoData) else {
//            return
//        }
//        
//        if caption == "" {
//            uploadCaption = nil
//        }
//        if title == "" {
//            uploadTitle = nil
//        }
//        
//        let postRef = Firestore.firestore().collection("posts").document().collection(type.rawValue).document()
//        
//        let post = Post(id: postRef.documentID, videoUrl: videoUrl, caption: uploadCaption, numLikes: 0, ownerUid: uid, type: type, title: uploadTitle)
//        
//        guard let encodedPost = try? Firestore.Encoder().encode(post) else {
//            return
//        }
//        
//        try await postRef.setData(encodedPost)
//        await MainActor.run {
//            isUploading = false
//        }
//    }
}
