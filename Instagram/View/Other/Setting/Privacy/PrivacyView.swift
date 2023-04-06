//
//  PrivacyView.swift
//  Instagram
//
//  Created by SevenInfosystem on 31/03/23.
//

import SwiftUI

struct PrivacyView: View {
    
    @Binding var isON: Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            
            HStack {
                //back Button
                Button {
                    dismiss.callAsFunction()
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                        .font(.system(size: 22))
                        .fontWeight(.medium)
                }
                .padding(.trailing)
                    
                Text("Privacy")
                    .foregroundColor(.black)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Spacer()
            }
            
            Divider()
           
            ScrollView {
                HStack {
                    Text("Account privacy")
                        .font(.title3)
                        .fontWeight(.bold)
                    Spacer()
                }.padding(.vertical)
                
                Toggle(isOn: $isON) {
                    Label("Private account", systemImage: "lock")
                        .font(.title3)
                }
                
                Divider()
                    .padding(.vertical)
                
                HStack {
                    Text("Intercation")
                        .font(.title3)
                        .fontWeight(.bold)
                    Spacer()
                }
                
                //MARK: - Limit
                Label("Limit", systemImage: "exclamationmark.circle.fill")
            }
            
        }
        .padding(.horizontal)
    }
}

struct PrivacyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyView(isON: .constant(false))
    }
}
