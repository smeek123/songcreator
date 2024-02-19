//
//  ProjectCellView.swift
//  songcreator
//
//  Created by Sean Meek on 2/18/24.
//

import SwiftUI

struct ProjectPromoCellView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: (UIScreen.main.bounds.width / 2) - 35, height: 230)
    }
}

struct LargeProjectCellView: View {
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: (UIScreen.main.bounds.width) - 35, height: 230)
            
            Text("Project Title")
                .foregroundStyle(.black)
                .font(.title)
                .fontWeight(.semibold)
                .padding()
        }
    }
}

#Preview {
    LargeProjectCellView()
}
