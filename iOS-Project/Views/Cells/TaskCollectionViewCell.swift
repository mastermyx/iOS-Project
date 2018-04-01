//
//  AddTaskCollectionViewCell.swift
//  iOS-Project
//
//  Created by Arthur Hatchiguian on 25/03/2018.
//  Copyright © 2018 Arthur Hatchiguian. All rights reserved.
//

import UIKit

class TaskCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var urgentImageView: UIImageView!
    @IBOutlet weak var importantImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 5
    }
    
    func setCell(forTask task: Task) {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        
        self.dateLabel.text = formatter.string(from: task.date)
        
        switch task.type {
        case .regular:
            self.backgroundColor = UIColor.init(rgb: 0xF8E81C).withAlphaComponent(0.4)
            
            self.statusLabel.text = "regular".localized
            
            self.urgentImageView.alpha = 0.25
            self.importantImageView.alpha = 0.25
            break
        case .important:
            self.backgroundColor = UIColor.init(rgb: 0x0DA0B2).withAlphaComponent(0.8)
            
            self.statusLabel.text = "important".localized
            
            self.urgentImageView.alpha = 0.25
            self.importantImageView.alpha = 1
            break
        case .urgent:
            self.backgroundColor = UIColor.init(rgb: 0x7ED321).withAlphaComponent(0.8)
            
            self.statusLabel.text = "urgent".localized
            
            self.urgentImageView.alpha = 1
            self.importantImageView.alpha = 0.25
            break
        case .urgentAndImportant:
            self.backgroundColor = UIColor.init(rgb: 0xFF3A07).withAlphaComponent(0.8)
            
            self.statusLabel.text = "urgentAndImportant".localized
            
            self.urgentImageView.alpha = 1
            self.importantImageView.alpha = 1
            break
        }
    }
    
}
