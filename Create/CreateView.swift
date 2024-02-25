//
//  CreateView.swift
//  songcreator
//
//  Created by Sean Meek on 2/25/24.
//

import SwiftUI
import PhotosUI
import AVKit

struct CreateView: View {
    @StateObject var viewmodel = CreateViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                PhotosPicker(selection: $viewmodel.selectedItem, matching: .videos) {
                    Text("create")
                }
            }
            .navigationTitle("Create")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CreateView()
}
