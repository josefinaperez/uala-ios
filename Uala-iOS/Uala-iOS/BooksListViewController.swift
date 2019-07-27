//
//  ViewController.swift
//  Uala-iOS
//
//  Created by Josefina Perez on 27/07/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import UIKit

class BooksListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet fileprivate var booksTable: UITableView!
    
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
            
            self.books = books.sorted(by: { $0.popularidad > $1.popularidad })
            self.booksTable.reloadData()
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let bookCell = tableView.dequeueReusableCell(withIdentifier: "bookCell") as? BookTableViewCell else {
            return UITableViewCell()
        }
        
        bookCell.configureWith(book: books[indexPath.row])
        return bookCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 224
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let bookDetailController = storyboard?.instantiateViewController(withIdentifier: "bookDetailController")
            as? BookDetailViewController else {
            return
        }
        
        bookDetailController.book = books[indexPath.row]
        navigationController?.pushViewController(bookDetailController, animated: true)
    }
    
    @IBAction fileprivate func reverseBooksOrder () {
        books.reverse()
        booksTable.reloadData()
    }

}

