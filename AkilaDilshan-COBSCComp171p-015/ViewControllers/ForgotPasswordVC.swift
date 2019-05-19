//
//  ForgotPasswordVC.swift
//  AkilaDilshan-COBSCComp171p-015
//
//  Created by Akila Dilshan on 5/13/19.
//  Copyright © 2019 Akila Dilshan. All rights reserved.
//

import UIKit
import FirebaseAuth

class ForgotPasswordVC: UIViewController {
    
    //MARK:- UI Outlets
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    //MARK:- Variables
    var utill = Utill()
    let alertService = AlertService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        utill.setupTextFields(textFields: [emailTextField])
    }
    
    
    
    //MARK:- Functions
    
    func retriveNewPassword(userName:String){
        
        Auth.auth().sendPasswordReset(withEmail: userName) { (error) in
            if (error != nil){
                self.alertService.alert(title: "Error", body: error!.localizedDescription, buttonTitle: "Try Again", isSuccess: false, isDone: false, completion: {
                    self.retriveNewPassword(userName: userName)
                })
                
                

            }else{
                self.utill.showToast(message: "Password reset link has been sent your email", view: self.view, width: 350)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    self.dismiss(animated: true, completion: nil)
                })
            }
        }
    }
    
    
    //MARK:- UI Actions
  
    @IBAction func closePasswordView(_ sender: Any) {
        
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window!.layer.add(transition, forKey: nil)
        self.dismiss(animated: false, completion: nil)
    }
    
    
    @IBAction func getNewPassword(_ sender: Any) {
        
        if ((emailTextField.text?.isEmpty)!){
            utill.showToast(message: "Please fill the fields", view: self.view, width: 350)
            return
        }else{
            retriveNewPassword(userName: emailTextField.text!)
        }
        
    }
    

}
