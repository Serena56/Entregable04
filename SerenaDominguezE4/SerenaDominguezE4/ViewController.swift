//
//  ViewController.swift
//  SerenaDominguezE4
//
//  Created by Digital House on 4/7/18.
//  Copyright © 2018 Digital House. All rights reserved.
//

import UIKit
import FirebaseUI


class ViewController: UIViewController, FUIAuthDelegate {
    
    
    
    var authUI: FUIAuth?
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.authUI = FUIAuth.defaultAuthUI()
        self.authUI?.delegate = self
        
        let providers: [FUIAuthProvider] = [
            FUIGoogleAuth()]
        self.authUI?.providers = providers

        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "primerSegue", sender: self)
        }
    }
    
    @IBAction func loginTappedButton(_ sender: Any) {
        if Auth.auth().currentUser == nil {
            if let authViewController = self.authUI?.authViewController() {
                present(authViewController, animated: true, completion: nil)
            }
            }
            }

    }

