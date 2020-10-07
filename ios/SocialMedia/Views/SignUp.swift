//
//  SignUp.swift
//  SocialMedia
//
//  Created by StartupBuilder.INFO on 10/7/20.
//

import SwiftUI
import Combine
import Amplify

struct SignUp: View {
    
    @State var username = ""
    @State var password = ""
    
    @State var error: String?
    
    @State var verificationMode = false
    @State var registrationRequest: AnyCancellable?
    
    var body: some View {
        Form {
            
            if let errorMessage = self.error {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
            }
            
            TextField("Username", text: $username)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .disableAutocorrection(true)
            
            SecureField("Password", text: $password)
            
            Button("Register") {
                error = nil
                registrationRequest = signUp(username: username, password: password, email: username)
            }
            
            if registrationRequest != nil {
                Button("Cancel") {
                    registrationRequest?.cancel()
                }
            }
        }
    }
    
    func signUp(username: String, password: String, email: String) -> AnyCancellable {
        let userAttributes = [AuthUserAttribute(.email, value: email)]
        let options = AuthSignUpRequest.Options(userAttributes: userAttributes)
        
        return Amplify.Auth.signUp(username: username, password: password, options: options)
            .resultPublisher
            .sink {
                registrationRequest = nil
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

struct SignUpVerification: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
