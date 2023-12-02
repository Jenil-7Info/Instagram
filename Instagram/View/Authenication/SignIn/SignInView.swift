//
//  SignInView.swift
//  Instagram
//
//  Created by SevenInfosystem on 28/03/23.
//

import SwiftUI
import FBSDKLoginKit

struct SignInView: View {

    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isShowPass: Bool = false
    @State private var isForgatePass: Bool = false
    @State private var isSignUp: Bool = false
    @StateObject var fbManger = facebookLoginMangerViewModel()
    @AppStorage("isLogIn") var isLogin: Bool = false
    @AppStorage("email") var email: String = ""
    
    var body: some View {
        ZStack {
            
            instaBackgroundColor
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
//                Text("Instagram")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .padding()
//                    .padding(.bottom, 20)
                
                LogoView()
                    .shadow(radius: 8)
                    .padding(.bottom)
                
                //MARK: - textfileds and Forgate btn
                VStack {
                    //phone number, username and email
                    TextField("", text: $username, prompt: Text("Username, Phone number or Email").foregroundColor(.white).font(.system(size: 16))
                        .fontWeight(.semibold))
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(.white.opacity(0.11))
                        }
                        .padding(.horizontal)
                    
                    //password
                    if isShowPass {
                        HStack {
                            TextField("", text: $password, prompt: Text("Password").foregroundColor(.white).font(.system(size: 16))
                                .fontWeight(.semibold))
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .autocorrectionDisabled(true)
                                .textInputAutocapitalization(.never)
                                .keyboardType(.webSearch)
                            Button {
                                isShowPass.toggle()
                            } label: {
                                Image(systemName: isShowPass ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(.white)
                            }
                        }
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(.white.opacity(0.11))
                        }
                        .padding(.top, 5)
                        .padding([.horizontal, .bottom])
                    } else {
                        HStack {
                            SecureField("", text: $password, prompt: Text("Password").foregroundColor(.white).font(.system(size: 16))
                                .fontWeight(.semibold))
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .autocorrectionDisabled(true)
                                .textInputAutocapitalization(.never)
                                .keyboardType(.webSearch)
                            Button {
                                isShowPass.toggle()
                            } label: {
                                Image(systemName: isShowPass ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(.white)
                            }
                        }
                        .frame(height: 35)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.white.opacity(0.11))
                        }
                        .padding(.top, 5)
                        .padding([.horizontal, .bottom])
                    }
                    
                    //forgate password
                    HStack {
                        Spacer()
                        
                        Button {
                            isForgatePass.toggle()
                        } label: {
                            Text("Forgot password?")
                                .fontWeight(.semibold)
                        }
                        .navigationDestination(isPresented: $isForgatePass) {
                            EmptyView()
                                .navigationBarBackButtonHidden(true)
                        }
                    }
                    .padding(.horizontal)
                }
                
                //Sign In button
                Button {
                    withAnimation(.spring()) {
                        if username == "" || password == "" {
                            isLogin = false
                        } else {
                            isLogin = true
                        }
                    }
                } label: {
                    Text("Log In")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white.opacity(0.85))
                        .frame(maxWidth: .infinity)
                }
                .frame(height: 30)
                .padding()
                .background {
                    if username == "" || password == "" {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.white.opacity(0.5) ,style: StrokeStyle(lineWidth: 2))
                    } else {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.blue.opacity(0.85))
                    }
                }
                .padding()
                .disabled(username == "" || password == "")
                
                //OR
                HStack {
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white.opacity(0.8))
                        .frame(height: 2)
                    
                    Text("OR")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white.opacity(0.8))
                        .frame(height: 2)
                }
                .padding(.horizontal)
                
                //MARK: - Facebook Login
                Button {
                    //fbManger.SignInWithFacebook()
                } label: {
                    Image("fb")
                        .resizable()
                        .frame(width: 25, height: 25)
                    Text("Continue with Facebook")
                }
                .alert("Alert", isPresented: $fbManger.isAlert, actions: {
                    Text("OK")
                }, message: {
                    Text(fbManger.errMessage)
                })
                .padding()
                
                Spacer()
                
                Divider()
                
                HStack {
                    Text("Don't have an account?")
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white.opacity(0.75))
                    
                    Button {
                        isSignUp.toggle()
                    } label: {
                        Text("Sign Up.")
                            .fontWeight(.bold)
                    }
                    .navigationDestination(isPresented: $isSignUp) {
                        SignUpView()
                            .navigationBarBackButtonHidden(true)
                    }
                }
                .padding()
            }
            .foregroundColor(.white)
            .onDisappear {
                storeDate()
            }
        }
    }

    //MARK: - Functions
    func storeDate() {
        if username.contains(where: {$0 == "@" || $0 == "."}) {
            email = username
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
