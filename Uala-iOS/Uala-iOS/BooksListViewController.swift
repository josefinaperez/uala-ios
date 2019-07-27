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
    fileprivate var reversedBookOrder: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        getBooks()
    }
    
    fileprivate func getBooks() {
        BooksManager.shared.getBooks(callback: {(books, success) in
            
            guard success, let books = books else {
                return
            }
            
            self.books = BooksManager.shared.sortByPopularity(books: books, reversed: self.reversedBookOrder)
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
        reversedBookOrder = !reversedBookOrder
        books.reverse()
        booksTable.reloadData()
    }
    
    @IBAction fileprivate func showAvailableBooks() {
        let booksFiltered = BooksManager.shared.filterByAvailability(available: true)
        books = BooksManager.shared.sortByPopularity(books: booksFiltered, reversed: reversedBookOrder)
        booksTable.reloadData()
    }
    
    @IBAction fileprivate func showNotAvailableBooks() {
        let booksFiltered = BooksManager.shared.filterByAvailability(available: false)
        books = BooksManager.shared.sortByPopularity(books: booksFiltered, reversed: reversedBookOrder)
        booksTable.reloadData()
    }
    
    @IBAction fileprivate func showAllBooks() {
        let booksFiltered = BooksManager.shared.getAllBooks()
        books = BooksManager.shared.sortByPopularity(books: booksFiltered, reversed: reversedBookOrder)
        booksTable.reloadData()
    }

}

