//
//  ProjectsView.swift
//  songcreator
//
//  Created by Sean Meek on 2/18/24.
//

import SwiftUI

struct ProjectsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Text("My Demos")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Spacer()
                    }
                    .padding()
                    .padding(.horizontal, 6)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0..<10) { _ in
                                ProjectPromoCellView()
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    HStack {
                        Text("My Projects")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Spacer()
                    }
                    .padding()
                    .padding(.horizontal, 6)
                    
                    VStack(spacing: 35) {
                        ForEach(0..<3) { _ in
                            LargeProjectCellView()
                        }
                    }
                }
            }
            .navigationTitle("Projects")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProjectsView()
}
