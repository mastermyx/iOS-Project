//
//  RoundedView.swift
//  iOS-Project
//
//  Created by Arthur Hatchiguian on 31/03/2018.
//  Copyright © 2018 Arthur Hatchiguian. All rights reserved.
//

import UIKit

class RoundedView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 5
    }
}
