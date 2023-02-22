//
//  BottomTextFieldView.swift
//  Instagram
//
//  Created by SevenInfosystem on 12/01/23.
//

import SwiftUI

struct BottomTextFieldView: View {
    @Binding var messages: [String]
    @Binding var messageText: String
    
    var body: some View {
        HStack{
            TextField("Message...", text: $messageText)
                .padding()
                .frame(height: 60)
                .autocorrectionDisabled(true)
                .cornerRadius(30)
                .onSubmit {
                    sentMessage(message: messageText)
                }
            
            
            if messageText.isEmpty {
                Button {
                    //open mic
                } label: {
                    Image(systemName: "mic")
                        .resizable()
                        .frame(width: 18, height: 20)
                        .foregroundColor(.black)
                        .padding(.trailing)
                }
                .buttonStyle(.borderless)
                
                
                NavigationLink {
                    GalleryView()
                } label: {
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 22, height: 24)
                        .foregroundColor(.black)
                        .padding(.trailing)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "doc")
                        .resizable()
                        .frame(width: 20, height: 22)
                        .foregroundColor(.black)
                        .padding(.trailing)
                }
            }
            else {
                Button {
                    sentMessage(message: messageText)
                } label: {
                    Text("Send")
                        .font(.title2)
                        .foregroundColor(.blue)
                }
                .padding(.trailing, 20)
            }
        }
        .background(.gray.opacity(0.15)).clipShape(RoundedRectangle(cornerSize: .init(width: 50, height: 50)))
        .padding(.horizontal)
    }
    
    
    func sentMessage(message: String) {
        withAnimation {
            messages.append("[USER]" + message)
            self.messageText = ""
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
                messages.append(replayMessage(message: message))
            }
        }
    }
}

struct BottomTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTextFieldView(messages: .constant([]), messageText: .constant(""))
    }
}
