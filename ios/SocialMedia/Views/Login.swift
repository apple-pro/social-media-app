//
//  Login.swift
//  SocialMedia
//
//  Created by StartupBuilder.INFO on 10/7/20.
//

import SwiftUI
import Amplify

struct Login: View {
    
    @State var error = ""
    @State var username = ""
    @State var password = ""
    
    @State var showSignUp = false
    
    var body: some View {
        Form {
            
            Section(header: Text("Login")) {
                
                if !error.isEmpty {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.caption)
                }
                
                TextField("Username", text: $username)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .disableAutocorrection(true)
                
                SecureField("Password", text: $password)
                
                Button("Login") {
                    signIn(username: username, password: password)
                }
            }
            
            Section(header: Text("Register")) {
                
                Button("Register") {
                    error = ""
                    showSignUp.toggle()
                }
            }
            
        }
        .sheet(isPresented: $showSignUp) {
            SignUp()
        }
    }
    
    func signIn(username: String, password: String) {
        Amplify.Auth.signIn(username: username, password: password) { result in
            switch result {
            case .success:
                print("Sign in succeeded")
            case .failure(let e):
                error = e.errorDescription
                print("Sign in failed \(error)")
                
            }
        }
    }
    
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
