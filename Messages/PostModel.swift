//
//  PostModel.swift
//  songcreator
//
//  Created by Sean Meek on 2/17/24.
//

import Foundation

struct Post: Identifiable, Codable {
    let id: String
    let videoUrl: String
//    let caption: String?
//    let numLikes: Int
//    let owner: User
//    let type: PostType
//    let title: String?
}

enum PostType: String, CaseIterable, Codable {
    case demo, song
}
