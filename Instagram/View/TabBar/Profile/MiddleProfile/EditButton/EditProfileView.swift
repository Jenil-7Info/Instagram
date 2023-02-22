//
//  EditProfileView.swift
//  Instagram
//
//  Created by SevenInfosystem on 17/01/23.
//

import SwiftUI

struct EditProfileView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "multiply")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }
                .padding(.horizontal)

                Text("Edit profile")
                    .font(.title2)
                    .bold()
                
                Spacer()
                
                NavigationLink {
                    
                } label: {
                    Image(systemName: "checkmark")
                        .font(.title)
                        .foregroundColor(.blue)
                }
                .padding(.trailing)
            }
            Spacer()
            
            Image("")
            
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
