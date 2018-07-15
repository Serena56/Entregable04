//
//  WelcomeViewController.swift
//  SerenaDominguezE4
//
//  Created by Digital House on 11/7/18.
//  Copyright © 2018 Digital House. All rights reserved.
//

import UIKit
import FirebaseUI

class WelcomeViewController: UIViewController, FUIAuthDelegate {
    
    var authUI: FUIAuth?
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        if let currentUser = Auth.auth().currentUser {
            if Auth.auth().currentUser != nil {
                welcomeLabel.text = "¡Welcome \(currentUser.displayName ?? "no name")!"
            } else {  welcomeLabel.text = "¡Welcome!" }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch {
            print("unable to sign out: \(error)")
        }
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

}
