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
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                InstagramRootView()
                    .onOpenURL { url in
                        ApplicationDelegate.shared.application(UIApplication.shared, open: url, sourceApplication: nil, annotation: UIApplication.OpenURLOptionsKey.annotation)
                    } 
            }
        }
    }
}


// AppDelegate.swift
//class AppDelegate: UIResponder, UIApplicationDelegate {
//func application(
//    _ application: UIApplication,
//    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//) -> Bool {
//    ApplicationDelegate.shared.application(
//        application,
//        didFinishLaunchingWithOptions: launchOptions
//    )
//
//    return true
//}
//
//func application(
//    _ app: UIApplication,
//    open url: URL,
//    options: [UIApplication.OpenURLOptionsKey : Any] = [:]
//) -> Bool {
//    ApplicationDelegate.shared.application(
//        app,
//        open: url,
//        sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
//        annotation: options[UIApplication.OpenURLOptionsKey.annotation]
//    )
//}
//}
