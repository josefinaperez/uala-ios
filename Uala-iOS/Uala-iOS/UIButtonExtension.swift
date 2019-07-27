//
//  UIButtonExtension.swift
//  Uala-iOS
//
//  Created by Josefina Perez on 27/07/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    public func configureAsSelected() {
        backgroundColor = UIColor(red: 12/255, green: 64/255, blue: 97/255, alpha: 1)
        setTitleColor(UIColor.white, for: .normal)
    }
    
    public func configureAsUnselected() {
        backgroundColor = UIColor.white
        setTitleColor(UIColor(red: 12/255, green: 64/255, blue: 97/255, alpha: 1), for: .normal)
    }
}
