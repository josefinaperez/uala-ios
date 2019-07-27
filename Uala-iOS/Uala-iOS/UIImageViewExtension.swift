//
//  UIImageViewExtension.swift
//  Uala-iOS
//
//  Created by Josefina Perez on 27/07/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    public func downloadImage(from urlString: String) {
       
        guard let url = URL(string: urlString) else {
            return
        }
        
        NetworkingManager.shared.getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                self.image = UIImage(data: data)
            }
        }
    }
}
