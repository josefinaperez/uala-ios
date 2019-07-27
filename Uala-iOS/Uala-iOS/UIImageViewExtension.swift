//
//  UIImageViewExtension.swift
//  Uala-iOS
//
//  Created by Josefina Perez on 27/07/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    public func downloadImage(from urlString: String) {
        
        let placeholder = UIImage(named: "placeholder")
        
        guard let url = URL(string: urlString) else {
            self.image = placeholder
            return
        }
        
        self.kf.setImage(with: url, placeholder: placeholder)
    }
}
