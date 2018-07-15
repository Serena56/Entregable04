//
//  AuthenticationService.swift
//  SerenaDominguezE4
//
//  Created by Serena Dominguez on 14/7/18.
//  Copyright © 2018 Digital House. All rights reserved.
//

import Foundation
import FirebaseUI

class AuthenticationService, FUIAuthDelegate {
    
    var authUI: FUIAuth?
    
    func configureFirebaseAuthUI() {
        let providers: [FUIAuthProvider] = [
            FUIGoogleAuth()]
        self.authUI?.providers = providers
    }
    
    
    func currentUser() -> User? {
        return Auth.auth().currentUser
        
    }
    func isLoguedIn() -> Bool {
        return currentUser() != nil
    }
    
    func logoutSession() -> Void {
        do {
            try Auth.auth().signOut()
        } catch {
            print("unable to sign out: \(error)")
        }
    }
    
    
}
