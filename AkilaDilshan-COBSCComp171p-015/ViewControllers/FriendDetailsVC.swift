//
//  FriendDetailsVC.swift
//  AkilaDilshan-COBSCComp171p-015
//
//  Created by Akila Dilshan on 5/15/19.
//  Copyright © 2019 Akila Dilshan. All rights reserved.
//

import UIKit

class FriendDetailsVC: UIViewController {
    
    //MARK:- UI Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var phoneNumLabel: UILabel!
    
    //MARK:- Variables
    var studentObject:Student! = nil


    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    
    }
    
    //MARK:- Functions
    
    func setupLayout(){
        
    nameLabel.text = studentObject.fName + " " + studentObject.lName
    birthdayLabel.text = studentObject.birthday
    ageLabel.text = "\(studentObject.age)"
    cityLabel.text = studentObject.city
    phoneNumLabel.text = studentObject.phoneNum
        
    }
    
    //MARK- UI Actions

}
