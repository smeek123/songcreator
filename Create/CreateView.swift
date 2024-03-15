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
                    
                    VStack(spacing: 10) {
                        Picker(selection: $type) {
                            ForEach(PostType.allCases, id: \.self) { type in
                                Text(type.rawValue.capitalized(with: .current))
                            }
                        } label: {
                            Text("What type of post is this?")
                        }
                        .pickerStyle(.segmented)
                        .colorMultiply(.purple)
                        .frame(width: UIScreen.main.bounds.width * 0.95)
                        
                        if type == .demo {
                            Text("A post labeled demo will show up in the demos section on the feed. These posts are unfinished pieces of songs used to encourage colaboration.")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundStyle(.secondary)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                        } else if type == .song {
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
