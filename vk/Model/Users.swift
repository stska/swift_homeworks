//
//  Users.swift
//  vk
//
//  Created by user155176 on 14/08/2019.
//  Copyright © 2019 user155176. All rights reserved.
//

import Foundation
import UIKit


class Users{
    var firstName:String
    var secondName:String
    var friendList = [String]()
    var avatar: UIImage?
   
    
    init(firstName:String, secondName:String,friendList: Array<String>) {
        self.firstName = firstName
        self.secondName = secondName
        self.friendList = friendList
    }
    
    
    
}
