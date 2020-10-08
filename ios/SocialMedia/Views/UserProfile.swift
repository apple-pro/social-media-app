//
//  UserProfile.swift
//  SocialMedia
//
//  Created by StartupBuilder.INFO on 10/7/20.
//

import SwiftUI
import Amplify

struct UserProfile: View {
    
    @State var errorMessage = ""
    @State var dataLoaded = false
    
    @State var givenName = ""
    @State var familyName = ""
    @State var email = ""
    
    var body: some View {
        Form {
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.caption)
            }
            
            if dataLoaded {
                
                Section(header: Text("Profile")) {
                    TextField("Given Name", text: $givenName)
                    TextField("Family Name", text: $familyName)
                    TextField("Email Name", text: $email)
                }
                
                Button("Logout") {
                    endSession()
                }
                
            } else {
                
                Text("Please Wait...")
                
                Button("Try Again?") {
                    fetchAttributes()
                }
            }
            
        }.onAppear {
            fetchAttributes()
        }
    }
    
    func fetchAttributes() {
        
        Amplify.Auth.fetchUserAttributes() { result in
            switch result {
            case .success(let attributes):
                print("User attributes - \(attributes)")
                dataLoaded = true
                
                if let givenNameAttribute = attributes.first (where: { a in a.key == .givenName } ) {
                    givenName = givenNameAttribute.value
                }
                
                if let familyNameAttribute = attributes.first (where: { a in a.key == .familyName } ) {
                    familyName = familyNameAttribute.value
                }
                
                if let emailAttribute = attributes.first (where: { a in a.key == .email } ) {
                    email = emailAttribute.value
                }
            case .failure(let error):
                print("Fetching user attributes failed with error \(error)")
                dataLoaded = false
                errorMessage = error.localizedDescription
            }
        }
    }
    
    func endSession() {
        Amplify.Auth.signOut()
    }
    
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
