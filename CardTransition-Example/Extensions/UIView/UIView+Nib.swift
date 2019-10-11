//
//  UIView+Nib.swift
//  CardTransition-Example
//
//  Created by William Boles on 09/10/2019.
//  Copyright © 2019 William Boles. All rights reserved.
//

import UIKit

extension UIView {
    public class func instantiateViewFromNib<T>(_ nibName: String, inBundle bundle: Bundle = Bundle.main) -> T? {
        if let objects = bundle.loadNibNamed(nibName, owner: nil) {
            for object in objects {
                if let object = object as? T {
                    return object
                }
            }
        }
        
        return nil
    }
}
