//
//  ContactoTableViewCell.swift
//  SerenaDominguezE4
//
//  Created by Serena Dominguez on 15/7/18.
//  Copyright © 2018 Digital House. All rights reserved.
//

import UIKit

class ContactoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nombreYapellidoLabel: UILabel!
    @IBOutlet weak var telefonoLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var empresaLabel: UILabel!
    
    func setup(contacto: Contacto) ->Void {
   
         self.nombreYapellidoLabel.text = contacto.nombreYapellido
         self.telefonoLabel.text = contacto.telefono
         self.emailLabel.text = contacto.email
         self.empresaLabel.text = contacto.empresa
    }

}
