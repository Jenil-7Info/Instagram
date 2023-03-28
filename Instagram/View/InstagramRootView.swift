//
//  InstagramRootView.swift
//  Instagram
//
//  Created by SevenInfosystem on 28/03/23.
//

import SwiftUI

struct InstagramRootView: View {
    
    @AppStorage("isLogIn") private var isLogin: Bool = false
    
    var body: some View {
        Group {
            if isLogin {
                InstagramMainPage()
            } else {
                SignInView()
            }
        }
    }
}

struct InstagramRootView_Previews: PreviewProvider {
    static var previews: some View {
        InstagramRootView()
    }
}
