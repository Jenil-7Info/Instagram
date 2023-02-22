//
//  ReelView.swift
//  Instagram
//
//  Created by SevenInfosystem on 12/01/23.
//

import SwiftUI

struct ReelView: View {
    
    @State private var isFollow: Bool = false
    
    var body: some View {
        
        GeometryReader { geo in
            
            let width = geo.size.width
            let height = geo.size.height
            
            ScrollView {
                
                ForEach(0..<100) { _ in
                    
                    ZStack {
                        Rectangle()
                            .frame(height: height)
                            .foregroundColor(.gray)
                            .padding(.bottom, 20)
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Spacer()
                                HStack {
                                    Image("funnyImage")
                                        .resizable()
                                        .frame(width: width/9, height: height/20)
                                        .clipShape(Circle())
                                    
                                    Text("comedy.video28")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    
                                    Button {
                                        self.isFollow.toggle()
                                    } label: {
                                        Text(isFollow ? "Following" : "Follow")
                                            .bold()
                                    }
                                }
                                Text("Tarak Maheta ka Olata chasham ep:254")
                                    .padding(.top, 8)
                                    .lineLimit(1)
                                    .foregroundColor(.white)
                                Text("comedy_edit. 17.9." + "  Original audio")
                                    .lineLimit(1)
                                    .foregroundColor(.white)
                                    .padding(.init(top: 1, leading: 3, bottom: 60, trailing: 20))
                                
                            }
                            .padding(.leading, 10)
                            
                            
                            Spacer()
                            
                            ReelLikeArea()
                        }
                    }
                }
            }
            .scrollIndicators(.never)
        }
    }
}

struct ReelView_Previews: PreviewProvider {
    static var previews: some View {
        ReelView()
    }
}
