//
//  Book.swift
//  Uala-iOS
//
//  Created by Josefina Perez on 27/07/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import UIKit
import SwiftyJSON

class Book: NSObject {
    
    public var id: String
    public var nombre: String
    public var autor: String
    public var disponible: Bool
    public var popularidad: Int
    public var imagen: String
    
    init(json: JSON) {
        id = json["id"].stringValue
        nombre = json["nombre"].stringValue
        autor = json["autor"].stringValue
        disponible = json["disponibilidad"].boolValue
        popularidad = json["popularidad"].intValue
        imagen = json["imagen"].stringValue
    }

}
