//
//  ContentView.swift
//  SocialMedia
//
//  Created by StartupBuilder.INFO on 10/7/20.
//

import SwiftUI
import Amplify


struct ContentView: View {
    
    @State var userLoggedIn = false
    
    var body: some View {
        ZStack {
            if userLoggedIn {
                UserProfile()
            } else {
                Login()
            }
        }.onAppear {
            listenToAuthEvents()
        }
    }
    
    func listenToAuthEvents() {
        Amplify.Hub.listen(to: .auth) { payload in
            switch payload.eventName {
            case HubPayload.EventName.Auth.signedIn:
                print("User signed in")
                userLoggedIn = true
                
            case HubPayload.EventName.Auth.sessionExpired:
                print("Session expired")
                userLoggedIn = false
                
            case HubPayload.EventName.Auth.signedOut:
                print("User signed out")
                userLoggedIn = false
                
            default:
                break
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
