//
//  ProjectModel.swift
//  songcreator
//
//  Created by Sean Meek on 2/18/24.
//

import Foundation

struct Project {
    let id: String
    let owner: User
    let title: String
    let collaborators: [User]?
    let imageUrl: String?
    let trackUrl: String?
    let description: String?
}
