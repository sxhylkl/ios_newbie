//
//  XTextField.swift
//  HomePwner Pro
//
//  Created by 华海智 on 2017/10/25.
//  Copyright © 2017年 海志. All rights reserved.
//

import UIKit

class XTextField: UITextField {
    
    override func becomeFirstResponder() -> Bool {
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 1
        return super.becomeFirstResponder()
    }
    
    override func resignFirstResponder() -> Bool {
        self.layer.borderWidth = 0
        return super.resignFirstResponder()
    }
}
