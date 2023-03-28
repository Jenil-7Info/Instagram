//
//  HeaderProfileView.swift
//  Instagram
//
//  Created by SevenInfosystem on 21/01/23.
//

import SwiftUI

struct HeaderProfileView: View {
    
    @Binding var insta_id: String
    @State private var isEnblePopover: Bool = false
    
    var body: some View {
        HStack {
            Text(insta_id)
                .font(.title2)
                .bold()
                .padding()
            //Padding: - If user touch in insta_id, then open the account adding option...
            
            Spacer()
            
            NavigationLink {
                
            } label: {
                Image(systemName: "plus.app")
                    .font(.title)
                    .foregroundColor(.black)
            }
            
            Button {
                self.isEnblePopover.toggle()
            } label: {
                Image("navigation")
                    .resizable()
                    .font(.title)
                    .frame(width: 35, height: 50)
                    .foregroundColor(.black)
            }
            .padding(.horizontal)
            .sheet(isPresented: $isEnblePopover) {
                PopoverScreen()
            }
        }
    }
}

struct HeaderProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HeaderProfileView(insta_id: .constant("__Jenu_79__"))
            //PopoverScreen()
        }
    }
}


