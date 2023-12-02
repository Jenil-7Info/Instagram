//
//  InstagramApp.swift
//  Instagram
//
//  Created by SevenInfosystem on 04/01/23.
//

import SwiftUI
import FacebookCore
import FBSDKCoreKit // facebook SDK

@main
struct InstagramApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                InstagramRootView()
                    .onAppear(){
                        ApplicationDelegate.shared.application(UIApplication.shared, didFinishLaunchingWithOptions: nil)
                    }
            }
        }
    }
}
