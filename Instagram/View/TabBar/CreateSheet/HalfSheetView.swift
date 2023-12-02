//
//  HalfSheetView.swift
//  Instagram
//
//  Created by SevenInfosystem on 02/12/23.
//

import SwiftUI

struct HalfSheetView: View {
    var body: some View {
        ZStack {
            
            Color.gray
                .ignoresSafeArea()
            
            Color.black.opacity(0.8)
                .ignoresSafeArea()
            
            VStack {
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 55, height: 8)
                
                Text("Create")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .padding()
                
                NavigationLink {
                    
                } label: {
                    CustomHalfSheetButton(imgString: "Reel", customBtnText: "Reel")
                        .navigationBarBackButtonHidden(true)
                }
                
                NavigationLink {
                    
                } label: {
                    CustomHalfSheetButton(imgString: "Reel", customBtnText: "Post")
                        .navigationBarBackButtonHidden(true)
                }
                
                NavigationLink {
                    
                } label: {
                    CustomHalfSheetButton(imgString: "Reel", customBtnText: "Story")
                        .navigationBarBackButtonHidden(true)
                }
                
                NavigationLink {
                    
                } label: {
                    CustomHalfSheetButton(imgString: "Reel", customBtnText: "Story Highlight")
                        .navigationBarBackButtonHidden(true)
                }
                
                NavigationLink {
                    
                } label: {
                    CustomHalfSheetButton(imgString: "", customBtnText: "Live")
                        .navigationBarBackButtonHidden(true)
                }
                
                NavigationLink {
                    
                } label: {
                    CustomHalfSheetButton(imgString: "Reel", customBtnText: "Guide")
                        .navigationBarBackButtonHidden(true)
                }
                
                Spacer()
            }
            .foregroundColor(.white)
        }
    }
}

struct HalfSheetView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HalfSheetView()
        }
    }
}

struct CustomHalfSheetButton: View {
    
    var imgString: String
    var customBtnText: String
    
    var body: some View {
        HStack {
            Image(imgString)
                .resizable()
                .scaledToFit()
                .frame(width: 50)
            
            Text(customBtnText)
                .font(.system(size: 22))
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}
