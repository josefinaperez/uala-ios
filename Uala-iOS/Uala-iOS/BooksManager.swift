//
//  BooksManager.swift
//  Uala-iOS
//
//  Created by Josefina Perez on 27/07/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import UIKit
import SwiftyJSON

class BooksManager: NSObject {
    
    static let shared = BooksManager()
    fileprivate let getBooksUrl = "https://qodyhvpf8b.execute-api.us-east-1.amazonaws.com/test/books"
    
    public func getBooks(callback: @escaping ([Book]?, Bool) -> Void) {
        
        NetworkingManager.shared.getRequest(url: getBooksUrl, callback: {(books, success) in
            
            guard success, let booksJson = books else {
                callback(nil, success)
                return
            }
            
            var booksArray: [Book] = []
            for book in booksJson.arrayValue {
                booksArray.append(Book(json: book))
            }
            
        })
    }

}
