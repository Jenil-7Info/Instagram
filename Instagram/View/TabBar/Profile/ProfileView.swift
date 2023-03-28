//
//  ProfileView.swift
//  Instagram
//
//  Created by SevenInfosystem on 04/01/23.
//

import SwiftUI

struct ProfileView: View {
    
    @AppStorage("email") var email: String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                
                HeaderProfileView(insta_id: .constant("__Jenu_79__"))
                
                ImageAndFollowerView()
                //NOTE: - Includeing Image, Name, Post, follow, Follwing...
                
                HStack {
                    VStack(alignment: .leading) {
                        //ProfileName
                        Text("Jenil K Rughani")
                            .font(.title3)
                            .bold()
                        
                        //Boi
                        Text("🧑🏻‍💻 IOS Devloper 🧑🏻‍💻")
                            
                        Text("Email: \(email)")
                            .padding(.vertical, 5)
                    }
                    Spacer()
                }
                .padding(.init(top: 10, leading: 20, bottom: 5, trailing: 0))
                
                
                MiddleProfileView()
                //NOTE: - Include Edit Button And Highligts
                
                BottomPhotoGridView()
                /*
                NOTE: - This View Uploaded Image Or Reel section
                Important:- This section not meger GalleryView because gallery only open gallery but this section is display the only uploaded Image and Reel so...
                 */
            }
        }
        .scrollIndicators(.hidden)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
