//
//  CircleView.swift
//  Click
//
//  Created by Jonathan Uttankar on 01/07/17.
//  Copyright © 2017 Jonathan Uttankar. All rights reserved.
//

import UIKit

class CircleView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.width / 2
        clipsToBounds = true
        
    }

}
