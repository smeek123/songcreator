//
//  ProfileImageView.swift
//  songcreator
//
//  Created by Sean Meek on 1/7/24.
//

import SwiftUI
//import Kingfisher

enum ProfileImageSize {
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    var dimension: CGFloat {
        switch self {
        case .xSmall:
            return 40
        case .small:
            return 48
        case .medium:
            return 64
        case .large:
            return 80
        case .xLarge:
            return 100
        }
    }
}

struct ProfileImageView: View {
    let size: ProfileImageSize
    
    var body: some View {
//        if let imageUrl = user.profileImageUrl {
//            KFImage(URL(string: imageUrl))
//                .resizable()
//                .scaledToFill()
//                .frame(width: size, height: size)
//                .clipShape(Circle())
//        } else {
//            Image(systemName: "person.circle.fill")
//                .resizable()
//                .scaledToFill()
//                .frame(width: size, height: size)
//                .foregroundColor(.secondary)
//        }
        
        Image(systemName: "person.circle.fill")
            .resizable()
            .scaledToFill()
            .frame(width: size.dimension, height: size.dimension)
            .foregroundStyle(.secondary)
    }
}

#Preview {
    ProfileImageView(size: .xLarge)
}
