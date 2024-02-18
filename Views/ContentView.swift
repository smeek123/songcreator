//
//  ContentView.swift
//  songcreator
//ff
//  Created by Sean Meek on 12/31/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var register = RegistrationViewModel()
    
    var body: some View {
        MainTabView()
            .environmentObject(register)
    }
}

#Preview {
    ContentView()
}
