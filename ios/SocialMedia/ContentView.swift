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
    
    @State var userLoggedIn = false
    
    var body: some View {
        ZStack {
            if userLoggedIn {
                UserProfile()
            } else {
                Login()
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
