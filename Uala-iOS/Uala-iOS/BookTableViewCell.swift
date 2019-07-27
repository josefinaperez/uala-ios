//
//  BookTableViewCell.swift
//  Uala-iOS
//
//  Created by Josefina Perez on 27/07/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    @IBOutlet fileprivate var bookImg: UIImageView!
    @IBOutlet fileprivate var lblNombre: UILabel!
    @IBOutlet fileprivate var lblAutor: UILabel!
    @IBOutlet fileprivate var lblPopularidad: UILabel!
    @IBOutlet fileprivate var lblEstado: UILabel!

    public func configureWith(book: Book) {
        bookImg.downloadImage(from: book.imagen)
        lblNombre.text = book.nombre
        lblAutor.text = book.autor
        lblPopularidad.text = "\(book.popularidad)"
        lblEstado.text = book.disponible ? "Disponible" : "No disponible"
    }
}
