//
//  CreateViewModel.swift
//  songcreator
//
//  Created by Sean Meek on 2/25/24.
//

import Foundation
import SwiftUI
import PhotosUI

class CreateViewModel: ObservableObject {
    @Published var selectedItem: PhotosPickerItem? {
        didSet {
            Task {
                try await uploadVideo()
            }
        }
    }
    
    func uploadVideo() async throws {
        guard let item = selectedItem else {
            return
        }
        guard let videoData = try await item.loadTransferable(type: Data.self) else {
            return
        }
    }
}
