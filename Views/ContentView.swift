//
//  ContentView.swift
//  songcreator
//ff
//  Created by Sean Meek on 12/31/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("signedIn") var isSignedIn: Bool = false
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                SignInOptionsView()
            } else if let currentUser = viewModel.currentUser {
                MainTabView(user: currentUser)
            }
        }
    }
}

#Preview {
    ContentView()
}
