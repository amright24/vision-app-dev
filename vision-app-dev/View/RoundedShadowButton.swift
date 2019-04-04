//
//  RoundedShadowButton.swift
//  vision-app-dev
//
//  Created by Austin Rightnowar on 4/3/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit

class RoundedShadowButton: UIButton {

    override func awakeFromNib() {
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 15
        self.layer.shadowOpacity = 0.75
        self.layer.cornerRadius = self.frame.height / 2
    }

}
