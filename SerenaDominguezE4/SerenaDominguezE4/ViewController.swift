//
//  ViewController.swift
//  SerenaDominguezE4
//
//  Created by Digital House on 4/7/18.
//  Copyright © 2018 Digital House. All rights reserved.
//

import UIKit
import FirebaseUI
import Kingfisher


class ViewController: UIViewController, FUIAuthDelegate {
    
    var authUI: FUIAuth?
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.authUI = FUIAuth.defaultAuthUI()
        self.authUI?.delegate = self
        
        
        let providers: [FUIAuthProvider] = [
            FUIGoogleAuth()
        ]
        self.authUI?.providers = providers
        
        if let currentUser = Auth.auth().currentUser {
            if Auth.auth().currentUser != nil {
                do {
                    self.performSegue(withIdentifier: "primerSegue", sender: self)
                    }
                }
        } else {
            loginButton.setTitle("LOGIN", for: .normal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func loginTappedButton(_ sender: Any) {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
            } catch {}
            
            loginButton.setTitle("LOGIN", for: .normal)
//            label.text = ""
            
        } else {
            if let authViewController = self.authUI?.authViewController() {
                present(authViewController, animated: true, completion: nil)
            }
        }
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
//        label.text = user?.displayName
//        imageView.kf.setImage(with: user?.photoURL)
        if let currentUser = Auth.auth().currentUser {
            if Auth.auth().currentUser != nil {
                do {
        self.performSegue(withIdentifier: "primerSegue", sender: self)
        loginButton.setTitle("LOGOUT", for: .normal)
                }
    }
    }
}
}

