//
//  LogoView.swift
//  Instagram
//
//  Created by SevenInfosystem on 02/12/23.
//

import SwiftUI

struct LogoView: View {
    
    var body: some View {
        
        Circle()
            .fill(logoGreadintColor)
            .padding()
            .frame(width: 150)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.white, style: StrokeStyle(lineWidth: 6))
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 65)
                    .overlay {
                        VStack {
                            HStack(spacing: 0) {
                                Spacer()
                                
                                Circle()
                                    .fill(.white)
                                    .frame(width: 10)
                                    .padding([.trailing, .top], 8)
                            }
                            .padding(.bottom, -5)
                            
                            Circle()
                                .stroke(.white, style: StrokeStyle(lineWidth: 7))
                                .frame(width: 60)
                        }
                        .padding(.bottom)
                    }
            }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
