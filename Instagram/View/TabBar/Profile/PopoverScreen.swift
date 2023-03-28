//
//  PopoverScreen.swift
//  Instagram
//
//  Created by SevenInfosystem on 23/01/23.
//

import SwiftUI

struct PopoverScreen: View {
    @State private var isPresentSettingView: Bool = false
    
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                
                Image("remove")
                    .resizable()
                    .frame(width: 60, height: 50)
                
                Spacer()
            }
            
            //MARK: - SettingView Link
            Button {
                self.isPresentSettingView.toggle()
            } label: {
                NameOfScreenWithSystemImage(systemImage: "gearshape", text: "Setting")
            }
            .fullScreenCover(isPresented: $isPresentSettingView) {
                SettingView()
            }
            
            //MARK: - Your acitivity Link
            Button {
                
            } label: {
                NameOfScreenWithSystemImage(systemImage: "clock.arrow.circlepath", text: "Your activity")
            }
            .fullScreenCover(isPresented: $isPresentSettingView) {
                EmptyView()
            }
            
            //MARK: - Archive Link
            Button {
                
            } label: {
                NameOfScreenWithSystemImage(systemImage: "clock.badge.checkmark", text: "Archive", imageWidth: 35)
            }
            .fullScreenCover(isPresented: $isPresentSettingView) {
                EmptyView()
            }
            
            //MARK: - Qr Code Link
            Button {
                
            } label: {
                NameOfScreenWithSystemImage(systemImage: "qrcode.viewfinder", text: "QR code")
            }
            .fullScreenCover(isPresented: $isPresentSettingView) {
                EmptyView()
            }
            
            //MARK: - Saved View Link
            Button {
                
            } label: {
                NameOfScreenWithSystemImage(systemImage: "bookmark", text: "Saved", imageWidth: 23, imageHeight: 28)
            }
            .fullScreenCover(isPresented: $isPresentSettingView) {
                EmptyView()
            }
            
            //MARK: - Digital Collection Link
            Button {
                
            } label: {
                NameOfScreenWithSystemImage(systemImage: "checkmark.shield", text: "Digital Collection", imageWidth: 25)
            }
            .fullScreenCover(isPresented: $isPresentSettingView) {
                EmptyView()
            }
            
            //MARK: - Close Friend Link
            Button {
                
            } label: {
                NameOfScreenWithFaltIconImage(image: "bulleted", text: "Close Friends")
            }
            .fullScreenCover(isPresented: $isPresentSettingView) {
                EmptyView()
            }
            
            //MARK: - Favorites Link
            Button {
                
            } label: {
                NameOfScreenWithSystemImage(systemImage: "star", text: "Favorites")
            }
            .fullScreenCover(isPresented: $isPresentSettingView) {
                EmptyView()
            }
            
            //MARK: - Covid-19 information center Link
            Button {
                
            } label: {
                NameOfScreenWithSystemImage(systemImage: "bolt.heart", text: "Covid-19 information center")
            }
            .fullScreenCover(isPresented: $isPresentSettingView) {
                EmptyView()
            }
            
        }
        //.navigationBarBackButtonHidden(true)
    }
}


struct PopoverScreen_Previews: PreviewProvider {
    static var previews: some View {
        PopoverScreen()
    }
}
