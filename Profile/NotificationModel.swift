//
//  NotificationModel.swift
//  songcreator
//
//  Created by Sean Meek on 2/19/24.
//

import Foundation
import Firebase

struct Notification: Identifiable, Codable {
    let id: String
    let title: String
    let timestamp: Timestamp
    let imageUrl: String?
    let user: User?
}
