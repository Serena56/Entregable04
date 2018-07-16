//
//  AddViewController.swift
//  SerenaDominguezE4
//
//  Created by Digital House on 16/7/18.
//  Copyright © 2018 Digital House. All rights reserved.
//

import UIKit
import FirebaseUI

class AddViewController: UIViewController {
    
    
    @IBOutlet weak var nombreYapellidoAdd: UITextField!
    @IBOutlet weak var telefonoAdd: UITextField!
    @IBOutlet weak var emailAdd: UITextField!
    @IBOutlet weak var empresaAdd: UITextField!
    
    var contacto: [Contacto] = []
    
    var ref = Database.database().reference()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addTappedButton(_ sender: Any) {
        let telefono = telefonoAdd.text ?? "no telefone"
        let email = emailAdd.text ?? "no email"
        let empresa = empresaAdd.text ?? "no company"
        let nombreYapellido = nombreYapellidoAdd.text ?? "no nama"
        
        if let currentUser = Auth.auth().currentUser {
       
                let contactosRef = ref.child("usuarios").child(currentUser.uid).child(nombreYapellido).setValue([ "Nombre y Apellido" : "\(nombreYapellido)" , "Telefono" : "\(telefono)" , "Email" : "\(email)" , "Empresa" : "\(empresa)" ])
        }
            navigationController?.popViewController(animated: true)
        
        
    }
    }
    
    




