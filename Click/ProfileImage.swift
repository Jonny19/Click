//
//  ProfileImage.swift
//  Click
//
//  Created by Jonathan Uttankar on 03/07/17.
//  Copyright © 2017 Jonathan Uttankar. All rights reserved.
//

import UIKit

class ProfileImage: UIImageView {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.width / 2
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        clipsToBounds = true
        
    }
    

}
