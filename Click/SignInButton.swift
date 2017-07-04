//
//  SignInButton.swift
//  Click
//
//  Created by Jonathan Uttankar on 04/07/17.
//  Copyright © 2017 Jonathan Uttankar. All rights reserved.
//

import UIKit

class SignInButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.5).cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 20
        //        layer.backgroundColor = UIColor.white.withAlphaComponent(0.5).cgColor
        
    } 

}
