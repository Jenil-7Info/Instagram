//
//  HeaderProfileView.swift
//  Instagram
//
//  Created by SevenInfosystem on 12/01/23.
//

import SwiftUI
import PhotosUI

struct ImageAndFollowerView: View {
    
    @State private var profileImage = UIImage(named: "Jenil")!
    @State private var isPresent: Bool = false
    @State private var isSelection: Bool = false
    @State private var isSheetOpen: Bool = false
    
    var body: some View {
        
        HStack {
            
            Image(uiImage: profileImage)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 15))
                .onTapGesture {
                    isPresent.toggle()
                }
                .actionSheet(isPresented: $isPresent) {
                    ActionSheet(
                        title: Text("ActionSheet"),
                        message: Text("Are You sure Change the Photo?"),
                        buttons: [
                            .default(Text("Gallery"), action: {
                                self.isSheetOpen = true
                            }),
                            .default(Text("Take photo")),
                            .cancel(Text("Cancle"))
                        ]
                    )
                }
                
            Spacer()
            
            VStack {
                Text("157")
                Text("Posts")
            }
            .bold()
            .font(.title3)
            
            Spacer()
            
            VStack {
                Text("30.2K")
                Text("Follower")
            }
            .bold()
            .font(.title3)
            
            Spacer()
            
            VStack {
                Text("10.1K")
                Text("Following")
            }
            .bold()
            .font(.title3)
            Spacer()
        }
        .sheet(isPresented: $isSheetOpen) {
            OpenGallery(image: $profileImage)
        }
    }
    
}

struct ImageAndFollowerView_Previews: PreviewProvider {
    static var previews: some View {
        ImageAndFollowerView()
    }
}
