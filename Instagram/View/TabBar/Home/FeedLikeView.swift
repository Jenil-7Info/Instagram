//
//  FeedLikeView.swift
//  Instagram
//
//  Created by SevenInfosystem on 12/01/23.
//

import SwiftUI

struct FeedLikeView: View {
    
    @State private var isHeartToach: Bool = false
    @State private var isSave: Bool = false
    @State private var sysmbolHeight: CGFloat = 24
    
    var body: some View {
        HStack {

            //Like
            Button {
                self.isHeartToach.toggle()
            } label: {
                Image(systemName: isHeartToach ? "heart.fill" : "heart")
                    .resizable()
                    .frame(width: 25, height: sysmbolHeight)
                    .foregroundColor(isHeartToach ?  .red : .black)
            }
            .padding(.horizontal)
            
            //Comment
            Button {
                //Add Comment View
            } label: {
                Image(systemName: "message")
                    .resizable()
                    .frame(width: 23, height: sysmbolHeight)
                    .foregroundColor(.black)
            }

            //Share
            Button {
                //Add Comment View
            } label: {
                Image(systemName: "paperplane")
                    .resizable()
                    .frame(width: 23, height: sysmbolHeight)
                    .foregroundColor(.black)
            }
            .padding(.horizontal)
            
            Spacer()
            
            //Save
            Button {
                self.isSave.toggle()
            } label: {
                Image(systemName: isSave ? "bookmark.fill" : "bookmark")
                    .resizable()
                    .frame(width: 20, height: sysmbolHeight)
                    .foregroundColor(.black)
            }
            .padding(.horizontal)
            
        }
        .padding(.bottom)
    }
}

struct FeedLikeView_Previews: PreviewProvider {
    static var previews: some View {
        FeedLikeView()
    }
}
