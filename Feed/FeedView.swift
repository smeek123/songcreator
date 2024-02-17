//
//  FeedView.swift
//  songcreator
//
//  Created by Sean Meek on 12/31/23.
//

import SwiftUI

struct FeedView: View {
    @State private var selection: Int = 0
    @Namespace private var pickerTabs
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(viewModel.posts) { post in
                        FeedCell(post: post)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.paging)
            .ignoresSafeArea()
            .overlay {
                VStack {
                    HStack(alignment: .center, spacing: 18) {
                        Button {
                            withAnimation(.linear) {
                                selection = 1
                            }
                        } label: {
                            Text("Songs")
                                .font(.system(size: 18))
                                .fontWeight(selection == 1 ? .bold : .semibold)
                                .foregroundStyle(selection == 1 ? .purple : .white)
                        }
                        
                        Button {
                            withAnimation(.linear) {
                                selection = 0
                            }
                        } label: {
                            Text("Demos")
                                .font(.system(size: 18))
                                .fontWeight(selection == 0 ? .bold : .semibold)
                                .foregroundStyle(selection == 0 ? .purple : .white)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 35, alignment: .top)
                    .background(Color(.black).opacity(0.15))
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        FeedView()
            .tint(.white)
    }
}
