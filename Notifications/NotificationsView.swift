//
//  NotificationsView.swift
//  songcreator
//
//  Created by Sean Meek on 1/7/24.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<35) { notification in
                    NotificationsCell()
                        .padding(.vertical, 3)
                }
            }
            .padding(.top, 5)
            .listStyle(.plain)
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NotificationsView()
}
