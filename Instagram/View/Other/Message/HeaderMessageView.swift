//
//  HeaderMessageView.swift
//  Instagram
//
//  Created by SevenInfosystem on 12/01/23.
//

import SwiftUI

struct HeaderMessageView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        HStack {
            
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 25, height: 22)
                    .padding(.leading, 10)
                    .foregroundColor(.black)
            })

            Image("Jethalal")
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .cornerRadius(50)
            
            VStack(alignment: .leading) {
                Text("Jethalal Gada")
                    .bold()
                Text("Jetha_123")
                    .padding(.trailing)
            }

            Spacer()
            
            Button {
                //Action
            } label: {
                Image(systemName: "phone")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.trailing)
                    .foregroundColor(.black)
            }

            Button {
                // Action
            } label: {
                Image(systemName: "video")
                    .resizable()
                    .frame(width: 28, height: 28)
                    .padding(.trailing, 20)
                    .foregroundColor(.black)
            }

        }
    }
}

struct HeaderMessageView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderMessageView()
    }
}
