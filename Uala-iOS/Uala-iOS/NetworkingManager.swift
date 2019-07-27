//
//  NetworkingManager.swift
//  Uala-iOS
//
//  Created by Josefina Perez on 27/07/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NetworkingManager: NSObject {
    
    static let shared = NetworkingManager()
    
    public func getRequest(url: String, callback: @escaping (JSON?, Bool) -> Void) {
        Alamofire.request(url).responseJSON { response in
            
            if response.result.error != nil {
                callback(nil, false)
            }
            
            guard let response = response.result.value else {
                callback(nil, false)
                return
            }
            
            let json = JSON(response)
            callback(json, true)
        }
    }
    
    public func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
