//
//  String.swift
//  iOS-Project
//
//  Created by Arthur Hatchiguian on 23/03/2018.
//  Copyright © 2018 Arthur Hatchiguian. All rights reserved.
//

import Foundation

extension String {
    var localized: String! {
        let localizedString = NSLocalizedString(self, comment: "")
        return localizedString
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
