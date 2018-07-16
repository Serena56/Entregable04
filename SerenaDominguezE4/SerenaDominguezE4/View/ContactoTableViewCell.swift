//
//  ContactoTableViewCell.swift
//  SerenaDominguezE4
//
//  Created by Serena Dominguez on 15/7/18.
//  Copyright © 2018 Digital House. All rights reserved.
//

import UIKit
import Kingfisher
import FirebaseStorage

class ContactoTableViewCell: UITableViewCell {
    

    let storageRef = Storage.storage().reference()
    
    @IBOutlet weak var nombreYapellidoLabel: UILabel!
    @IBOutlet weak var telefonoLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var empresaLabel: UILabel!
    @IBOutlet weak var imageContacto: UIImageView!
    
    
    func setup(contacto: Contacto) ->Void {
        
        
        if contacto.empresa == "Digital House" {
            let imageRef = self.storageRef.child("dh.png")
            imageRef.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
                if let dataValue = data {
                    let theImage = UIImage(data: dataValue)
                    self.imageContacto.image = theImage
                }
            }
        } else {
            let imageRef = self.storageRef.child("company.png")
            imageRef.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
                if let dataValue = data {
                    let theImage = UIImage(data: dataValue)
                    self.imageContacto.image = theImage
                }
            }
        }
        
        self.nombreYapellidoLabel.text = contacto.nombreYapellido
        self.telefonoLabel.text = contacto.telefono
        self.emailLabel.text = contacto.email
        self.empresaLabel.text = contacto.empresa
    }

}

