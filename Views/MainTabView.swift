//
//  MainTabView.swift
//  songcreator
//
//  Created by Sean Meek on 12/31/23.
//

import SwiftUI

struct MainTabView: View {
    @State private var selection: Int = 0
    
    var body: some View {
        VStack {
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
                
                Text("Favorites")
                    .tabItem {
                        if selection == 1 {
                            Image(systemName: "star.fill")
                        } else {
                            Image(systemName: "star")
                                .environment(\.symbolVariants, .none)
                        }
                    }.tag(1)
                
                Text("Create")
                    .tabItem {
                        Image(systemName: "plus.rectangle.fill")
                    }.tag(2)
                
                Text("Notifications")
                    .tabItem {
                        if selection == 3 {
                            Image(systemName: "bell.fill")
                        } else {
                            Image(systemName: "bell")
                                .environment(\.symbolVariants, .none)
                        }
                    }.tag(3)
                
                Text("Me")
                    .tabItem {
                        if selection == 4 {
                            Image(systemName: "person.circle.fill")
                        } else {
                            Image(systemName: "person.circle")
                                .environment(\.symbolVariants, .none)
                        }
                    }.tag(4)
            }
        }
        .accentColor(.primary)
    }
}

#Preview {
    MainTabView()
}
