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
    
    var body: some View {
        Form {
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.caption)
            }
            
            if dataLoaded {
                
                TextField("Given Name", text: $givenName)
                
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
            case .failure(let error):
                print("Fetching user attributes failed with error \(error)")
                dataLoaded = false
                errorMessage = error.localizedDescription
            }
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
