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
        VStack {
            
            Spacer()
            
            Text("Instagram")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
                .padding(.bottom, 20)
            
            //MARK: - textfileds and Forgate btn
            VStack {
                //phone number, username and email
                TextField("Phone number, username or email", text: $username)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.gray.opacity(0.11))
                }
                .padding(.horizontal)
                
                //password
                if isShowPass {
                    HStack {
                        TextField("Password", text: $password)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                            .keyboardType(.webSearch)
                        Button {
                            isShowPass.toggle()
                        } label: {
                            Image(systemName: isShowPass ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(Color("btn_color"))
                        }
                    }
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.gray.opacity(0.11))
                    }
                    .padding(.top, 5)
                    .padding([.horizontal, .bottom])
                } else {
                    HStack {
                        SecureField("Password", text: $password)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                            .keyboardType(.webSearch)
                        Button {
                            isShowPass.toggle()
                        } label: {
                            Image(systemName: isShowPass ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(Color("btn_color"))
                        }
                    }
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.gray.opacity(0.11))
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
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(username == "" || password == "" ? .blue.opacity(0.5) : .blue)
                    .frame(width: screenWidth-30 ,height: 50)
            }
            .padding()
            .disabled(username == "" || password == "")
            
            //OR
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.8))
                    .frame(height: 0.5)
                
                Text("OR")
                    .foregroundColor(.black.opacity(0.5))
                    .padding(.horizontal)
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.8))
                    .frame(height: 0.5)
            }
            .padding(.horizontal)
            
            //MARK: - Facebook Login
            Button {
                fbManger.SignInWithFacebook()
            } label: {
                Image("facebook")
                    .resizable()
                    .frame(width: 20, height: 20)
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
                    .foregroundColor(Color("btn_color").opacity(0.5))
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
        .onDisappear {
            storeDate()
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
