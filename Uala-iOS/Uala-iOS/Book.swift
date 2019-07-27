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
    
    fileprivate var id: String
    fileprivate var nombre: String
    fileprivate var autor: String
    fileprivate var disponibilidad: Bool
    fileprivate var popularidad: Int
    fileprivate var imagen: String
    
    init(json: JSON) {
        id = json["id"].stringValue
        nombre = json["nombre"].stringValue
        autor = json["autor"].stringValue
        disponibilidad = json["nombre"].boolValue
        popularidad = json["popularidad"].intValue
        imagen = json["imagen"].stringValue
    }

}
