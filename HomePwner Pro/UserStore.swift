//
//  UserStore.swift
//  HomePwner Pro
//
//  Created by 华海智 on 2017/10/24.
//  Copyright © 2017年 海志. All rights reserved.
//

import UIKit

class UserStore {
    
    var userList = [User]()
    
    func createUser () -> User{
        let newUser =  User.init(random: true)
        userList.append(newUser)
        return newUser
    }
    
    func getUsersAgeLessThan10 () -> [User]{
        var userAgeLessThan10 = [User]()
        for item in userList {
            if item.age <= 10 {
                userAgeLessThan10.append(item)
            }
        }
        return userAgeLessThan10
    }
    
    func getUsersAgeMoreThan10 () -> [User]{
        var getUsersAgeMoreThan10 = [User]()
        for item in userList {
            if item.age > 10 {
                getUsersAgeMoreThan10.append(item)
            }
        }
        return getUsersAgeMoreThan10
    }
    
    func removeItem(item: User) -> Void {
        if let index = userList.index(of: item) {
            userList.remove(at: index)
        }
    }
    
    func moveItem(from: Int,to: Int) -> Void {
        if from == to {
            return
        }
        let userItem = userList[from]
        userList.remove(at: from)
        userList.insert(userItem, at: to)
    }
}
