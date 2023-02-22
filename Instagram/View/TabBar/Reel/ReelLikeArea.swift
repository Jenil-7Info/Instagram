//
//  ReelLikeArea.swift
//  Instagram
//
//  Created by SevenInfosystem on 12/01/23.
//

import SwiftUI

struct ReelLikeArea: View {
    
    @State private var isHeartToachReel: Bool = false
    @State private var likeCount: Int = 21
    @State private var commentCount: Int = 10
   
    
    var body: some View {
        VStack {
            Spacer()
            
            //Reel Like
            Button {
                self.isHeartToachReel.toggle()
            } label: {
                Image(systemName: isHeartToachReel ? "heart.fill" : "heart")
                    .resizable()
                    .frame(width: 28, height: 26)
                    .foregroundColor(isHeartToachReel ?  .red : .black)
            }
            Text("\(likeCount)K")
                .foregroundColor(.black)
                .padding(.bottom, 10)
            
            //Reel Comment
            Button {
                
            } label: {
                Image(systemName: "message")
                    .resizable()
                    .frame(width: 28, height: 32)
                    .foregroundColor(.black)
            }
            Text("\(commentCount)K")
                .foregroundColor(.black)
                .padding(.bottom, 10)
            
            //Reel share
            Button {
                
            } label: {
                Image(systemName: "paperplane")
                    .resizable()
                    .frame(width: 28, height: 28)
                    .foregroundColor(.black)
            }
            .padding(.bottom, 15)
            
            
            //Reel Addtional
            Button {
                
            } label: {
                Image("dot3")
                    .resizable()
                    .frame(width: 28, height: 28)
                    .foregroundColor(.black)
            }
            .padding(.bottom, 10)
            
            
            Image("funnyImage")
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(10)
        }
        .padding(.trailing, 22)
        .padding(.bottom, 55)
    }
}

struct ReelLikeArea_Previews: PreviewProvider {
    static var previews: some View {
        ReelLikeArea()
    }
}
