//
//  FancyField.swift
//  Click
//
//  Created by Jonathan Uttankar on 28/06/17.
//  Copyright © 2017 Jonathan Uttankar. All rights reserved.
//

import UIKit

class FancyField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 20
        layer.backgroundColor = UIColor.white.withAlphaComponent(0.5).cgColor
        
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
 
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
    }
    
}
