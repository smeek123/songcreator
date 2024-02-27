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
    @State private var caption: String = ""
    @State private var title: String = ""
    @State private var type: PostType = .demo
    @StateObject var viewmodel = CreateViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 22) {
                TextField("Title", text: $title)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width * 0.95)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.purple, lineWidth: 2)
                    }
                
                TextField("Caption", text: $caption, axis: .vertical)
                    .lineLimit(5)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width * 0.95)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.purple, lineWidth: 2)
                    }
                
                PhotosPicker(selection: $viewmodel.selectedItem, matching: .videos) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(.purple, lineWidth: 3)
                            .fill(.black)
                            .frame(width: UIScreen.main.bounds.width * 0.95, height: 200)
                        
                        VStack {
                            Image(systemName: "plus")
                            
                            Text("Choice Video")
                        }
                        .font(.footnote)
                        .bold()
                        .foregroundStyle(.purple)
                    }
                }
                
                Spacer()
            }
            .padding(.top)
            .navigationTitle("Create")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CreateView()
}
