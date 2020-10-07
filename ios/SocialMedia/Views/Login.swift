//
//  Login.swift
//  SocialMedia
//
//  Created by StartupBuilder.INFO on 10/7/20.
//

import SwiftUI

struct Login: View {
    
    @State var username = ""
    @State var password = ""
    
    @State var showSignUp = false
    
    var body: some View {
        Form {
            
            Section(header: Text("Login")) {
                
                TextField("Username", text: $username)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .disableAutocorrection(true)
                
                SecureField("Password", text: $password)
                
                Button("Login") {
                    
                }
            }
            
            Section(header: Text("Register")) {
                
                Button("Register") {
                    showSignUp.toggle()
                }
            }
            
        }
        .sheet(isPresented: $showSignUp) {
            SignUp()
        }
    }
    
    
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
