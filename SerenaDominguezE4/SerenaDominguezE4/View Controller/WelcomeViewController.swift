
//  WelcomeViewController.swift
//  SerenaDominguezE4
//
//  Created by Digital House on 11/7/18.
//  Copyright © 2018 Digital House. All rights reserved.


import UIKit
import FirebaseUI

class WelcomeViewController: UIViewController, FUIAuthDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var authUI: FUIAuth?
    @IBOutlet weak var tableView: UITableView!
    var contactos: [Contacto] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        tableView.dataSource = self
        tableView.delegate = self
        
        getContactos()
        
        if let currentUser = Auth.auth().currentUser {
            if Auth.auth().currentUser != nil {
                self.title = "¡Hi, \(currentUser.displayName ?? "no name")!".uppercased()
            } else {   self.title = "¡Welcome!" }
        }
    }
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contacto = contactos[indexPath.row]
        let cellIdentifier = "contactoCelda"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        if let celdaContacto = cell as? ContactoTableViewCell {
            celdaContacto.setup(contacto: contacto)
        }

        return cell
    }
    
    @IBAction func logoutItemTapped(_ sender: Any) {
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
    
    func getContactos() -> Void {
        
         var ref = Database.database().reference()
        
        if let currentUser = Auth.auth().currentUser?.uid {
        
        let contactosRef = ref.child("usuarios").child(currentUser)
        
            contactosRef.observe(.value, with: { snapshot in
            
            if let dictionaryArray = snapshot.value as?  [String: AnyObject]{
                for dict in dictionaryArray.values{
                    if let contactDic = dict as? [String: AnyObject]{
                    let elContacto = Contacto(dictionary: contactDic)
                        self.contactos.append(elContacto)
                    
                }
                }
                self.tableView.reloadData()
                
                }
                
            })
            
        
        
    }

}
}
