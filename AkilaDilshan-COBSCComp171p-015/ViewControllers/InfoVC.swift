//
//  InfoVC.swift
//  AkilaDilshan-COBSCComp171p-015
//
//  Created by Akila Dilshan on 5/17/19.
//  Copyright © 2019 Akila Dilshan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class InfoVC: UIViewController {
    
    //MARK:- UI Outlets
    
    //MARK:- Variables
    var utill = Utill()
    var alertService = AlertService()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK:- Functions
    
    func signOut()  {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            
            self.utill.showToast(message: "User Signout Successfull", view: self.view, width: 350)
            
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                   self.performSegue(withIdentifier: "logoutSegue", sender: self)
            }
         
            
        } catch let signOutError as NSError {
            
            alertService.alert(title: "Error", body: signOutError.localizedDescription, buttonTitle: "Try again", isSuccess: false, isDone: true) {
                self.signOut()
            }
        }
    }
    
    
    //MARK:- UI Actions
    @IBAction func logoutTap(_ sender: Any) {
        signOut()
    }
    
}
