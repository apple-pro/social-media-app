//
//  ContentView.swift
//  SocialMedia
//
//  Created by StartupBuilder.INFO on 10/7/20.
//

import SwiftUI
import Combine
import Amplify


struct ContentView: View {
    
    @State var username = ""
    @State var password = ""
    
    @State var registrationTask: AnyCancellable?
    
    
    var body: some View {
        VStack {
            
            Form {
                
                TextField("Username", text: $username)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .disableAutocorrection(true)
                
                SecureField("Password", text: $password)
                
                Button("Register") {
                    registrationTask = signUp(username: username, password: password, email: username)
                }
                
                if registrationTask != nil {
                    Button("Cancel") {
                        registrationTask?.cancel()
                    }
                }
            }
        }
        .padding()
    }
    
    func signUp(username: String, password: String, email: String) -> AnyCancellable {
        let userAttributes = [AuthUserAttribute(.email, value: email)]
        let options = AuthSignUpRequest.Options(userAttributes: userAttributes)
        
        return Amplify.Auth.signUp(username: username, password: password, options: options)
            .resultPublisher
            .sink {
                if case let .failure(authError) = $0 {
                    print("An error occurred while registering a user \(authError)")
                }
            }
            receiveValue: { signUpResult in
                if case let .confirmUser(deliveryDetails, _) = signUpResult.nextStep {
                    print("Delivery details \(String(describing: deliveryDetails))")
                } else {
                    print("SignUp Complete")
                }
                
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
