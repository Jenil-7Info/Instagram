//
//  MessageView.swift
//  Instagram
//
//  Created by SevenInfosystem on 04/01/23.
//

import SwiftUI

struct MessageView: View {
    @State private var messageText: String = ""
    @State private var messages: [String] = []
    
    var body: some View {
        VStack {
            
            HeaderMessageView()
            
            ScrollView {
                ForEach(messages, id: \.self) { mess in
                    if mess.contains("USER") {
                        
                        let newMessage = mess.replacingOccurrences(of: "[USER]", with: "")
                        
                        HStack {
                            Spacer()
                            Text(newMessage)
                                .padding()
                                .foregroundColor(.white)
                                .background(.blue.opacity(0.8))
                                .cornerRadius(8)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                        }
                    }
                    else {
                        HStack {
                            Text(mess)
                                .padding()
                                .foregroundColor(.black)
                                .background(.gray.opacity(0.25))
                                .cornerRadius(8)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                            Spacer()
                        }
                    }
                }
                .rotationEffect(.degrees(180))
            }
            .rotationEffect(.degrees(180))
            .scrollIndicators(.never)
            
            BottomTextFieldView(messages: $messages, messageText: $messageText)
                .padding(.bottom, 20)
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
