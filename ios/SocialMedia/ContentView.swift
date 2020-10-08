//
//  ContentView.swift
//  SocialMedia
//
//  Created by StartupBuilder.INFO on 10/7/20.
//

import SwiftUI
import Amplify
import Combine

struct ContentView: View {
    
    @State var loginState: AppAuthState = .unknown
    @State var authUpdates: UnsubscribeToken?
    
    var body: some View {
        ZStack {
            switch loginState {
            case .unknown:
                PleaseWait(loginState: $loginState)
                
            case .authenticated:
                UserProfile()

            default:
                Login()
            }
        }
        .onAppear {
            startListeningToAuthEvents()
        }
        .onDisappear {
            stopListeningToAuthEvents()
        }
    }
    
    
    func startListeningToAuthEvents() {
        
        authUpdates = Amplify.Hub.listen(to: .auth) { payload in
            switch payload.eventName {
            case HubPayload.EventName.Auth.signedIn:
                print("User signed in")
                loginState = .authenticated
                
            case HubPayload.EventName.Auth.sessionExpired:
                print("Session expired")
                loginState = .unauthenticated
                
            case HubPayload.EventName.Auth.signedOut:
                print("User signed out")
                loginState = .unauthenticated
                
            default:
                loginState = .authenticated
                break
            }
        }
    }
    
    
    func stopListeningToAuthEvents() {
        
        if let updates = authUpdates {
            Amplify.Hub.removeListener(updates)
        }
    }
}

enum AppAuthState {
    case unknown, authenticated, unauthenticated
}

struct PleaseWait: View {
    
    @Binding var loginState: AppAuthState
    
    var body: some View {
        
        VStack {
            Text("Please wait...")
            
            Button("Retry") {
                
            }
        }
        .onAppear {
            fetchAttributes()
        }
    }
    
    func fetchAttributes() {
        
        Amplify.Auth.fetchUserAttributes() { result in
            switch result {
            case .success(let attributes):
                print("User attributes - \(attributes)")
                loginState = .authenticated
            case .failure(let error):
                print("Fetching user attributes failed with error \(error)")
                loginState = .unauthenticated
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
