//
//  songcreatorApp.swift
//  songcreator
//
//  Created by Sean Meek on 12/31/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct songcreatorApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var register = RegistrationViewModel()
    
    var body: some Scene {
        WindowGroup {
            SignInOptionsView()
                .environmentObject(register)
        }
    }
}
