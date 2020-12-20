//
//  UIView+Extensions.swift
//  VitrueHealthTest
//
//  Created by Olivier Conan on 19/12/2020.
//  Copyright © 2020 OlivierConan. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UIView extensions to shorten native methods
extension UIView {
    
    func add(_ views: UIView...) {
        add(views)
    }
    
    func add(_ views: [UIView]) {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
}
