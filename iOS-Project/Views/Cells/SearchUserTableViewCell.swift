//
//  SearchUserTableViewCell.swift
//  iOS-Project
//
//  Created by Arthur Hatchiguian on 03/04/2018.
//  Copyright © 2018 Arthur Hatchiguian. All rights reserved.
//

import UIKit

class SearchUserTableViewCell: UITableViewCell {
    @IBOutlet weak var profilePictureImageView: UIImageView!
    
    @IBOutlet weak var overlayView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
