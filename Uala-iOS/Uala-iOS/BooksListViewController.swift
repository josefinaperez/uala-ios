//
//  ViewController.swift
//  Uala-iOS
//
//  Created by Josefina Perez on 27/07/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import UIKit

class BooksListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    fileprivate var books: [Book] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        getBooks()
    }
    
    fileprivate func getBooks() {
        BooksManager.shared.getBooks(callback: {(books, success) in
            
            guard success, let books = books else {
                return
            }
            
            self.books = books
            
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

