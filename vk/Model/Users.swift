//
//  Users.swift
//  vk
//
//  Created by user155176 on 14/08/2019.
//  Copyright © 2019 user155176. All rights reserved.
//

import Foundation

class Users{
    var firstName:String
    var secondName:String
    var friendList = [String]()
    var category:String
    
    init(firstName:String, secondName:String,friendList: Array<String>, category:String) {
        self.firstName = firstName
        self.secondName = secondName
        self.friendList = friendList
        self.category = category
    }
    
}
