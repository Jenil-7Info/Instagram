//
//  MiddleProfileView.swift
//  Instagram
//
//  Created by SevenInfosystem on 12/01/23.
//

import SwiftUI

struct MiddleProfileView: View {
    
    @State private var isSuggestionBtnClick = false
    @State private var btnHeights = UIScreen.main.bounds.height/22
    
    var body: some View {
        VStack {
            HStack {
                
                NavigationLink {
                    EditProfileView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Text("Edit profile")
                        .padding()
                        .font(.system(size: 17))
                        .bold()
                        .foregroundColor(.black.opacity(0.9))
                        .frame(width: 320, height: btnHeights)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(8)
                        .padding(.leading)
                }
                
                Button {
                    isSuggestionBtnClick.toggle()
                } label: {
                    Image(systemName: isSuggestionBtnClick ? "person.fill.badge.plus" : "person.badge.plus")
                        .padding()
                        .font(.title3)
                        .foregroundColor(.black)
                        .frame(width: 40, height: btnHeights)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(8)
                        .padding(.trailing)
                }
            }
            
            StoryView(nameOfStory: "Highlights", heightOfStory: 60, widthOfStory: 60)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 0))
        }
    }
}

struct MiddleProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MiddleProfileView()
    }
}
