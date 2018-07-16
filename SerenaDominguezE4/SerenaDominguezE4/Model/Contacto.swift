//
//  Contacto.swift
//  SerenaDominguezE4
//
//  Created by Serena Dominguez on 15/7/18.
//  Copyright © 2018 Digital House. All rights reserved.
//

import Foundation
import FirebaseUI

class Contacto {
    
    var nombreYapellido: String
    var telefono: String
    var email: String
    var empresa: String

    
    
    init(nombreYapellido: String, telefono: String, email: String, empresa: String) {
        self.nombreYapellido = nombreYapellido
        self.telefono = telefono
        self.email = email
        self.empresa = empresa

    }
    
    init(dictionary: [String : AnyObject]) {
        self.nombreYapellido = dictionary["Nombre y Apellido"] as? String ?? "sin datos"
        self.telefono = dictionary["Telefono"] as? String ?? "sin datos"
        self.email = dictionary["Email"]  as? String ?? "sin datos"
        self.empresa = dictionary["Empresa"] as? String ?? "sin datos"
    }
    
    func toDictionary() -> [String : String] {
        var answer = [String : String]()
        answer["Nombre y Apellido"] = self.nombreYapellido
        answer["Telefono"] = self.telefono
        answer["Email"] = self.email
        answer["Empresa"] = self.empresa
        return answer
    }
    
}
