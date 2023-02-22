//
//  HomeHeaderView.swift
//  Instagram
//
//  Created by SevenInfosystem on 12/01/23.
//

import SwiftUI

struct HomeHeaderView: View {
    var body: some View {
        HStack {
            Text("Instagram")
                .font(.largeTitle)
                .bold()
                .padding(.leading, 20)
            
            Spacer()
            
            NavigationLink {
                GalleryView()
            } label: {
                Image(systemName: "plus.app")
                    .font(.title)
                    .foregroundColor(.black)
            }
            .padding(.trailing, 12)
            
            NavigationLink {
                MessageView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                Image(systemName: "ellipsis.message")
                    .resizable()
                    .frame(width: 25, height: 28)
                    .font(.title)
                    .badge(2)
                    .foregroundColor(.black.opacity(0.8))
            }
            .padding(.trailing, 20)
        }
    }
}

struct HomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeaderView()
    }
}
