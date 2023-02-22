//
//  HomeView.swift
//  Instagram
//
//  Created by SevenInfosystem on 12/01/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var storyVM = StoryViewModel()
    
    var body: some View {
        VStack {
            
            //NOTE: - Instagram Title, Gallery View And MessageView
            HomeHeaderView()
            
            //NOTE: - Story And Feeds [Like, comment, share and save]
            ScrollView {
                
                StoryView(nameOfStory: "Your Story")
                    .onAppear {
                        storyVM.callStoryAPI()
                    }
                
                ForEach(0..<100) { _ in
                    HStack {
                        Image("Jethalal")
                            .resizable()
                            .frame(width: 45, height: 45)
                            .scaledToFill()
                            .foregroundColor(.gray)
                            .clipShape(Circle())
                        VStack(alignment: .leading) {
                            Text("Jethalal._.123")
                                .font(.title3)
                                .bold()
                            Text("TMKOC")
                                .font(.callout)
                        }
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image("dot3")
                                .resizable()
                                .frame(width: 25, height: 30)
                                .foregroundColor(.black)
                                .padding(.trailing, 5)
                        }
                        
                        //NOTE: -  Added The Functionalitys Of Dits
                    }
                    .padding(.leading, 8)
                    .padding(.top)
                    
                    Rectangle()
                        .frame(height: 400)
                        .foregroundColor(.gray)
                    
                    //NOTE: - Feeds Like, Comments, share and Save Area
                    FeedLikeView()
                    
                }
            }
            .scrollIndicators(.never)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
