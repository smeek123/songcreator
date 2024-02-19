//
//  EditProfileviewModel.swift
//  songcreator
//
//  Created by Sean Meek on 2/19/24.
//

import Firebase
import SwiftUI
import PhotosUI

@MainActor
class EditProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(from: selectedImage)
            }
        }
    }
    @Published var profileImage: Image?
    @Published var username: String = ""
    @Published var name: String = ""
    @Published var bio: String = ""
    private var uiImage: UIImage?
    
    init(user: User) {
        self.user = user
        
        if let name = user.name {
            self.name = name
        }
        
        self.username = user.username
        
        if let bio = user.bio {
            self.bio = bio
        }
    }
    
    func loadImage(from item: PhotosPickerItem?) async {
        guard let item = item else {
            return
        }
        guard let data = try? await item.loadTransferable(type: Data.self) else {
            return
        }
        guard let uiImage = UIImage(data: data) else {
            return
        }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        var data = [String: Any]()
        
        if let uiImage = uiImage {
            let imageUrl = try? await ImageUploader.uploadImage(image: uiImage)
            data["profileImageUrl"] = imageUrl
        }
        
        if !name.isEmpty && user.name != name {
            data["name"] = name
        }
        
        if username.count >= 3 && user.username != username {
            data["username"] = username
        }
        
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }
        
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
            
//            try? await Firestore.firestore().collection("users").document(user.id).updateData(["searchTerms": user.searchTerms])
        }
    }
}
