//
//  NetworkingManager.swift
//  Uala-iOS
//
//  Created by Josefina Perez on 27/07/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import UIKit
import Alamofire

class NetworkingManager: NSObject {
    
    static let shared = NetworkingManager()
    
    public func getRequest(url: String, callback: @escaping ([String : Any]?, Bool) -> Void) {
        
        Alamofire.request(url)
            .responseJSON { response in
                
                if response.result.error != nil {
                    callback(nil, false)
                }
                
                guard let json = response.result.value as? [String: Any] else {
                    callback(nil, false)
                    return
                }
                
                callback(json, true)
        }
    }
}
