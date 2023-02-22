//
//  StoeryView.swift
//  Instagram
//
//  Created by SevenInfosystem on 04/01/23.
//

import SwiftUI
import UIKit

struct StoryView: View {
    
    var nameOfStory: String = ""
    var heightOfStory: CGFloat = 70
    var widthOfStory: CGFloat = 70
    var corner: CGFloat = 40

    @ObservedObject var vm = StoryViewModel()
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                
                ForEach(0..<100, id: \.self) { _ in
                    VStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: heightOfStory, height: widthOfStory)
                            .foregroundColor(.gray)
                            .background(
                                RoundedRectangle(cornerRadius: 38)
                                    .stroke(.green, lineWidth: 7)
                            )
                            .padding(.top)

                        Text(nameOfStory)
                    }
                    .padding(.leading, 5)
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

struct StoeryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}

struct RoundedEdge: ViewModifier {
    let width: CGFloat
    let color: Color
    let cornerRadius: CGFloat

    func body(content: Content) -> some View {
        content.cornerRadius(cornerRadius - width)
            .border(color, width: width)
            .cornerRadius(cornerRadius)
    }
}
