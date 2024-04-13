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
            VStack(spacing: 22) {
                if viewmodel.isUploading {
                    Spacer()
                    
                    ProgressView()
                        .tint(.purple)
                    
                    Text("Uploading Video")
                        .foregroundStyle(.purple)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                } else {
                    TextField("Title", text: $viewmodel.title)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width * 0.95)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.purple, lineWidth: 2)
                        }
                    
                    TextField("Caption", text: $viewmodel.caption, axis: .vertical)
                        .lineLimit(5)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width * 0.95)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.purple, lineWidth: 2)
                        }
                    
                    VStack(spacing: 10) {
                        Picker(selection: $viewmodel.type) {
                            ForEach(PostType.allCases, id: \.self) { type in
                                Text(type.rawValue.capitalized(with: .current))
                            }
                        } label: {
                            Text("What type of post is this?")
                        }
                        .pickerStyle(.segmented)
                        .colorMultiply(.purple)
                        .frame(width: UIScreen.main.bounds.width * 0.95)
                        
                        if viewmodel.type == .demo {
                            Text("A post labeled demo will show up in the demos section on the feed. These posts are unfinished pieces of songs used to encourage colaboration.")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundStyle(.secondary)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                        } else if viewmodel.type == .song {
                            Text("A post labeled as a song will show up in the songs section on the feed. These posts are finished tracks used to show-off your music.")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundStyle(.secondary)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                        }
                    }
                    
                    PhotosPicker(selection: $viewmodel.selectedItem, matching: .videos) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(.purple, lineWidth: 3)
                                .fill(.black)
                                .frame(width: UIScreen.main.bounds.width * 0.95, height: 200)
                            
                            VStack(spacing: 5) {
                                Image(systemName: "plus")
                                
                                Text("Choice Video")
                            }
                            .font(.footnote)
                            .bold()
                            .foregroundStyle(.purple)
                        }
                    }
                    .fullScreenCover(isPresented: $viewmodel.showVideo) {
                        VideoPreview()
                    }
                    
                    Spacer()
                }
            }
            .padding(.top)
            .navigationTitle("Create")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button {
                        if viewmodel.caption.count <= 1000 && viewmodel.title.count <= 50 {
                            
                        }
                    } label: {
                        Label("Upload Post", systemImage: "checkmark")
                    }
                }
            }
        }
    }
}

#Preview {
    CreateView()
}
