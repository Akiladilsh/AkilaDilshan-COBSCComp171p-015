//
//  FriendDetailsVC.swift
//  AkilaDilshan-COBSCComp171p-015
//
//  Created by Akila Dilshan on 5/15/19.
//  Copyright © 2019 Akila Dilshan. All rights reserved.
//

import UIKit
import Kingfisher

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
    
    var utill = Utill()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    
    }
    
    //MARK:- Functions
    
    func setupLayout(){
        
    let url = URL(string: studentObject.pf)
    imageView.kf.setImage(with: url)
    nameLabel.text = studentObject.fName + " " + studentObject.lName
    birthdayLabel.text = studentObject.birthday
    ageLabel.text = "\(studentObject.age)"
    cityLabel.text = studentObject.city
    phoneNumLabel.text = studentObject.phoneNum
        
    }
    
    //MARK- UI Actions

    @IBAction func faceBook(_ sender: Any) {
        
        
        let fbURlWeb = URL(string: studentObject.facebookUrl)

        UIApplication.shared.open(fbURlWeb!, options: [:], completionHandler: nil)
 
    }
    
    @IBAction func gmail(_ sender: Any) {
        
        utill.showToast(message: studentObject.gmailUrl, view: view, width: 350)
    }
    
    @IBAction func twitter(_ sender: Any) {
        
        utill.showToast(message: studentObject.twitterUrl, view: view, width: 350)
    }
}
