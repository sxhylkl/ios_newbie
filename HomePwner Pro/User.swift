//
//  User.swift
//  HomePwner Pro
//
//  Created by 华海智 on 2017/10/24.
//  Copyright © 2017年 海志. All rights reserved.
//

import UIKit

class User: NSObject{
    
    var name: String
    var age: Int
    var createdDate: Date
    var number: String
    
    init(name: String , age: Int ) {
        self.name = name
        self.age = age
        self.createdDate = Date()
        self.number = NSUUID.init().uuidString.components(separatedBy: "-").first!
        super.init()
    }
    
    convenience init(random: Bool = false) {
        if random {
            let names = ["华海智","宋浩","李超","荀博洋"]
            self.init(name: names[Int(arc4random_uniform(UInt32(names.count)))], age: Int(arc4random_uniform(30)))
        }else{
            self.init(name: "", age: 0)
        }
    }
    
}
