//
//  FeedCell.swift
//  songcreator
//
//  Created by Sean Meek on 12/31/23.
//

import SwiftUI

struct FeedCell: View {
    let post: Int
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.green)
                .containerRelativeFrame([.horizontal, .vertical])
                .overlay {
                    Text("Post \(post)")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                }
            
            VStack {
                Spacer()
                
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text("carlos, sainz")
                            .fontWeight(.semibold)
                        
                        Text("Rocket ship prepare for takeoff!!!")
                    }
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    
                    Spacer()
                    
                    VStack(spacing: 28) {
                        ProfileImageView(size: .xSmall)
                            .padding(.vertical, 0)
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.purple, lineWidth: 2)
                            }
                        
                        Button {
                            
                        } label: {
                            VStack {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                
                                Text("23.5K")
                                    .font(.caption)
                                    .bold()
                            }
                            .foregroundStyle(.white)
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "message.fill")
                                .resizable()
                                .frame(width: 28, height: 28)
                                .foregroundStyle(.white)
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "bookmark.fill")
                                .resizable()
                                .frame(width: 22, height: 28)
                                .foregroundStyle(.white)
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "arrowshape.turn.up.right.fill")
                                .resizable()
                                .frame(width: 28, height: 28)
                                .foregroundStyle(.white)
                        }
                    }
                    .padding(.bottom)
                }
                .padding(.bottom, 80)
            }
            .padding()
        }
    }
}

#Preview {
    FeedCell(post: 5)
}
