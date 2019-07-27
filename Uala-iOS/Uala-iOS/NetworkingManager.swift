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
        
        Alamofire.request(url)
            .responseJSON { response in
                
                if response.result.error != nil {
                    callback(nil, false)
                }
                
                guard let json = response.result.value as? JSON else {
                    callback(nil, false)
                    return
                }
                
                callback(json, true)
        }
    }
}