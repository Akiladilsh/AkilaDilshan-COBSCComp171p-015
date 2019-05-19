//
//  ProfileVC.swift
//  AkilaDilshan-COBSCComp171p-015
//
//  Created by Akila Dilshan on 5/17/19.
//  Copyright © 2019 Akila Dilshan. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    //MARK:- UI Outlets
    @IBOutlet weak var googleBtn: UIButton!
    @IBOutlet weak var twitterBtn: UIButton!
    @IBOutlet weak var facebookBtn: UIButton!
    
    //MARK:- Variables

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK:- Functions
    
    func openFacebook() {
        
        let fbURlWeb = URL(string: "https://www.facebook.com/akila.dilshan.9")
        let fbURLID = URL(string: "fb://profile/100003342402838")
        
        if (UIApplication.shared.canOpenURL(fbURLID!)){
            
            UIApplication.shared.open(fbURLID!, options: [:], completionHandler: nil)
            
        }else{
            UIApplication.shared.open(fbURlWeb!, options: [:], completionHandler: nil)
            UIApplication.shared.open(fbURLID!, options: [:], completionHandler: nil)
        }
    }
    
    func openMail(){
        
        let mailURL = URL(string: "message://akiladilsh20@gmail.com")!
        if UIApplication.shared.canOpenURL(mailURL) {
            UIApplication.shared.open(mailURL, options: [:], completionHandler: nil)
        }
    }
    
    //MARK:- UI Actions

    @IBAction func openMail(_ sender: Any) {
        openMail()
    }
    
    @IBAction func openFacebook(_ sender: Any) {
        openFacebook()
    }
    
    
    
}
