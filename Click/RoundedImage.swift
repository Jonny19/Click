//
//  RoundedImage.swift
//  Click
//
//  Created by Jonathan Uttankar on 28/06/17.
//  Copyright © 2017 Jonathan Uttankar. All rights reserved.
//

import UIKit

class RoundedImage: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()

        layer.cornerRadius = 10.0
        
    }

}
