//
//  Student.swift
//  AkilaDilshan-COBSCComp171p-015
//
//  Created by Akila Dilshan on 5/16/19.
//  Copyright © 2019 Akila Dilshan. All rights reserved.
//

import UIKit

class Student {
    
    var id:String
    var fName:String
    var lName:String
    var city:String
    var pf:String
    var gmailUrl:String
    var facebookUrl:String
    var phoneNum:String
    var twitterUrl:String
    var birthday:String
    var age:Int
    
    init(id:String, fName:String, lName:String, city:String, gmailUrl:String, facebookUrl:String, phoneNum:String,twitterUrl:String, birthday:String, age:Int, pf:String) {
        
        self.id = id
        self.fName = fName
        self.lName = lName
        self.city = city
        self.pf = pf
        self.gmailUrl = gmailUrl
        self.facebookUrl = facebookUrl
        self.phoneNum = phoneNum
        self.twitterUrl = twitterUrl
        self.birthday = birthday
        self.age = age
    }
    
    
}
