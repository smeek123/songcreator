//
//  MainTabView.swift
//  songcreator
//
//  Created by Sean Meek on 12/31/23.
//

import SwiftUI

struct MainTabView: View {
    @State private var selection: Int = 0
    let user: User
    
    var body: some View {
        TabView(selection: $selection) {
            FeedView()
                .tabItem {
                    if selection == 0 {
                        Image(systemName: "house.fill")
                    } else {
                        Image(systemName: "house")
                            .environment(\.symbolVariants, .none)
                    }
                }.tag(0)
            
            MessageListView()
                .tabItem {
                    if selection == 1 {
                        Image(systemName: "message.fill")
                    } else {
                        Image(systemName: "message")
                            .environment(\.symbolVariants, .none)
                    }
                }.tag(1)
            
            Text("Create")
                .tabItem {
                    Image(systemName: "plus.rectangle.fill")
                }.tag(2)
            
            NotificationsView()
                .tabItem {
                    if selection == 3 {
                        Image(systemName: "bell.fill")
                    } else {
                        Image(systemName: "bell")
                            .environment(\.symbolVariants, .none)
                    }
                }.tag(3)
            
            CurrentProfileView()
                .tabItem {
                    if selection == 4 {
                        Image(systemName: "person.circle.fill")
                    } else {
                        Image(systemName: "person.circle")
                            .environment(\.symbolVariants, .none)
                    }
                }.tag(4)
        }
        .accentColor(.primary)
    }
}

#Preview {
    MainTabView(user: User(id: "", username: "", email: ""))
}
