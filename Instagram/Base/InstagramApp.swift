//
//  InstagramApp.swift
//  Instagram
//
//  Created by SevenInfosystem on 04/01/23.
//

import SwiftUI

@main
struct InstagramApp: App {
    
    @State private var isLogin: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if isLogin {
                LoginView()
            }
            else {
                InstagramMainPage()
            }
        }
    }
}

