//
//  SignUp.swift
//  SocialMedia
//
//  Created by StartupBuilder.INFO on 10/7/20.
//

import SwiftUI
import Amplify

struct SignUp: View {
    
    @State var username = ""
    @State var password = ""
    
    @State var givenName = ""
    @State var familyName = ""
    @State var email = ""
    
    @State var error: String?
    
    @State var verificationCode = ""
    @State var verificationMode = false
    
    var body: some View {
        Form {
            
            if verificationMode {
                
                Section(header: Text("Verification")) {
                    TextField("Code", text: $verificationCode)
                        .disableAutocorrection(true)
                    
                    Text("A verification code was sent to \(email)")
                        .font(.caption)
                }
                
                Button("Verify") {
                    error = nil
                    _ = confirmSignUp(for: username, with: verificationCode)
                }
                
            } else {
                
                if let errorMessage = self.error {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                }
                
                Section(header: Text("Account")) {
                    TextField("Username", text: $username)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .disableAutocorrection(true)
                    
                    SecureField("Password", text: $password)
                }
                
                Section(header: Text("Profile")) {
                    TextField("Given Name", text: $givenName)
                        .disableAutocorrection(true)
                    
                    TextField("Family Name", text: $familyName)
                        .disableAutocorrection(true)
                    
                    TextField("Email", text: $email)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .disableAutocorrection(true)
                }
                
                Button("Register") {
                    signUp(username: username, password: password, email: email, givenName: givenName, familyName: familyName)
                    error = nil
                    verificationMode = true
                }
            }
            
        }
    }
    
    func signUp(username: String, password: String, email: String, givenName: String, familyName: String) {
        
        let userAttributes = [
            AuthUserAttribute(.email, value: email),
            AuthUserAttribute(.givenName, value: givenName),
            AuthUserAttribute(.familyName, value: familyName)
        ]
        
        let options = AuthSignUpRequest.Options(userAttributes: userAttributes)
        
        Amplify.Auth.signUp(username: username, password: password, options: options) { result in
            switch result {
            case .success(let signUpResult):
                if case let .confirmUser(deliveryDetails, _) = signUpResult.nextStep {
                    print("Delivery details \(String(describing: deliveryDetails))")
                } else {
                    print("SignUp Complete")
                }
            case .failure(let error):
                print("An error occurred while registering a user \(error)")
            }
        }
    }
    
    func confirmSignUp(for username: String, with confirmationCode: String) {
        
        Amplify.Auth.confirmSignUp(for: username, confirmationCode: confirmationCode) { result in
            switch result {
            case .success:
                print("Confirm signUp succeeded")
            case .failure(let error):
                print("An error occurred while confirming sign up \(error)")
            }
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
