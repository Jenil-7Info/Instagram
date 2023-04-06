//
//  SettingView.swift
//  Instagram
//
//  Created by SevenInfosystem on 23/01/23.
//

import SwiftUI

struct SettingView: View {
    
    @StateObject var fbMangerVM = facebookLoginMangerViewModel()
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    @State private var isLogoutAlert: Bool = false
    @AppStorage("isLogIn") private var isLogin: Bool = false
    @State private var text: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.black)
                }
                .padding(.leading)
                
                Text("Settings")
                    .font(.title2)
                
                Spacer()
            }
            
            ScrollView {
                VStack(alignment: .leading) {
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    TextField("Search", text: $text)
                    
                    Image(systemName: "multiply.circle.fill")
                        .padding(.trailing)
                        .offset(x: 10)
                        .opacity(text.isEmpty ? 0 : 1)
                        .onTapGesture {
                            text = ""
                        }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.gray.opacity(0.15))
                )
                .padding()
                    
                    
                   SettingsListView()
                    //NOTE: - List Of Profile Settings
                    
                    Divider()
                    
                    //MARK: - Account Center
                    Button {
                        
                    } label: {
                        Text("Accounts Center")
                    }
                    .padding(EdgeInsets(top: 15, leading: 15, bottom: 3, trailing: 21))
                  //  .padding([.top, .horizontal])
                    .font(.title2)
                    .foregroundColor(.blue)
                    
                    Text("Control settings for connted expriences across Instagram, the Facebook app and messenger, including story and post sharing and logging in.")
                        .padding(.horizontal)
                    
                    Divider()
                        .padding(.top)
                    
                    Text("Logins")
                        .padding([.top, .horizontal])
                        .font(.title3)
                        .bold()
                    
                    //MARK: - Add Account Code pandding...
                    Button {
                        
                    } label: {
                        Text("Add Account")
                    }
                    .padding()
                    
                    
                    //MARK: - Log out Code pandding...
                    Button {
                        self.isLogoutAlert = true
                    } label: {
                        Text("Log out")
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                    .alert("Alert", isPresented: $isLogoutAlert) {
                        //Alert(title: Text("Alert"), primaryButton: .cancel(Text("Cancle")), secondaryButton: .destructive(Text("Logout")))
                        HStack {
                            Button {
                                self.isLogoutAlert = false
                            } label: {
                                Text("Cancle")
                            }
                            Button {
                                withAnimation(.spring()) {
                                    dismiss.callAsFunction()
                                    fbMangerVM.SignOut()
                                    isLogin = false
                                }
                            } label: {
                                Text("Logout")
                                    .foregroundColor(.red)
                            }
                        }
                    } message: {
                        Text("Are you sure you want to logout?")
                    }
                }
            }
        }
    }
    
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}


struct SettingsListView: View {
    var body: some View {
        VStack {
            //MARK: - Follow And invite
            NavigationLink {
                
            } label: {
                NameOfScreenWithSystemImage(systemImage: "person.badge.plus", text: "Follow and invite friend")
            }
            
            //MARK: - Notification
            NavigationLink {
                
            } label: {
                NameOfScreenWithSystemImage(systemImage: "bell", text: "Notification", imageWidth: 28)
            }
            
            //MARK: - Privacy
            NavigationLink {
                
            } label: {
                NameOfScreenWithSystemImage(systemImage: "lock", text: "Privacy", imageWidth: 25)
            }
            
            //MARK: - Supervision
            NavigationLink {
                
            } label: {
                NameOfScreenWithSystemImage(systemImage: "person.2", text: "Supervision", imageHeight: 20)
            }
            
            //MARK: - Security
            NavigationLink {
                
            } label: {
                NameOfScreenWithSystemImage(systemImage: "checkmark.shield", text: "Security", imageWidth: 25)
            }
            
            //MARK: - Ads
            NavigationLink {
                
            } label: {
                NameOfScreenWithSystemImage(systemImage: "speaker.wave.2.circle", text: "Ads")
            }
            
            //MARK: - Accounts
            NavigationLink {
                
            } label: {
                NameOfScreenWithSystemImage(systemImage: "person.circle", text: "Accounts")
            }
            
            //MARK: - Help
            NavigationLink {
                
            } label: {
                NameOfScreenWithSystemImage(systemImage: "shippingbox.circle", text: "Help")
            }
            
            //MARK: - About
            NavigationLink {
                
            } label: {
                NameOfScreenWithSystemImage(systemImage: "i.circle", text: "About")
            }
            
            //MARK: - Theme
            NavigationLink {
                
            } label: {
                NameOfScreenWithSystemImage(systemImage: "paintpalette", text: "Theme")
            }
        }
        .padding(.bottom)
    }
}
