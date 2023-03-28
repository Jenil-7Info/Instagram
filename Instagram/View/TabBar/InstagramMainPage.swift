//
//  HomePage.swift
//  Instagram
//
//  Created by SevenInfosystem on 04/01/23.
//

import SwiftUI

struct InstagramMainPage: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
                .clipped()
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag(1)
                .clipped()
            
            ReelView()
                .tabItem {
                    Image(systemName: "play.square.stack.fill")
                    Text("Reel")
                }
                .tag(2)
                .clipped()
            
            LikeView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Like")
                }
                .tag(3)
                .clipped()
            
            ProfileView()
                .tabItem({
                    Image(systemName: "person.circle")
                    Text("Profile")
                })
                .tag(4)
                .clipped()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        InstagramMainPage()
    }
}
