//
//  LoginVC.swift
//  AkilaDilshan-COBSCComp171p-015
//
//  Created by Akila Dilshan on 5/13/19.
//  Copyright © 2019 Akila Dilshan. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
    
    //MARK:- UI Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loadingView: UIView!
    
    //MARK:- Variables
    var utill = Utill()
    var alertService = AlertService()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        utill.setupTextFields(textFields: [usernameTextField, passwordTextField])

    }
    
    //MARK:- Functions
    
    func loginUser(userName:String, pass:String){
        Auth.auth().signIn(withEmail: userName, password: pass) { [weak self] user, error in
            guard let strongSelf = self else { return }
            
            if (error != nil){
                
                //hide indicator
                strongSelf.hideIndicator()
                strongSelf.popAlertView(title: "Error", des: error!.localizedDescription, method: true, compl: {
                   strongSelf.loginUser(userName: (self?.usernameTextField.text)!, pass: (self?.passwordTextField.text)!)
                    strongSelf.dismiss(animated: true, completion: nil)
                })
                
            }else{
                
                //show indicator
                strongSelf.hideIndicator()
                strongSelf.performSegue(withIdentifier: "gotoHome", sender: self)
                }
            }
        }
    
    
    func popPasswordView(){
        
        let storyboard = UIStoryboard(name: "Util", bundle: .main)
        
        let passwordVC = storyboard.instantiateViewController(withIdentifier: "passWordVC") as! ForgotPasswordVC
        
        present(passwordVC, animated: true)
    }
    
    func popAlertView(title:String, des:String, method:Bool, compl:@escaping() -> Void ){
        
        let storyboard = UIStoryboard(name: "Util", bundle: .main)
        
        let alertVC = storyboard.instantiateViewController(withIdentifier: "AlertVC") as! AlertViewVC
        
        if (method == true) {
            alertVC.alertTitle = title
            alertVC.alertBody = des
            alertVC.isDone = false
            alertVC.isSuccess = false
            alertVC.actionButtonTitle = "Try again"
            alertVC.buttonAction = compl
            
            } else {
            
            alertVC.alertTitle = title
            alertVC.alertBody = des
            alertVC.isDone = true
            alertVC.isSuccess = false
            alertVC.actionButtonTitle = "Try again"
            alertVC.buttonAction = compl
        }
        
        
        present(alertVC, animated: true)
    }
    
    //show indicator
    
    func showIndicator()  {
        self.loadingView.alpha = 1
        self.view.bringSubviewToFront(self.loadingView)
    }
    
    
    //hide indicator
    
    func hideIndicator(){
        self.loadingView.alpha = 0
        self.view.sendSubviewToBack(self.loadingView)
    }
    
        //MARK:- UI Actions
    
    @IBAction func forgotPassTap(_ sender: Any) {
        popPasswordView()
    }

    
    @IBAction func loginTap(_ sender: Any) {
        
        if ((usernameTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)!){
            popAlertView(title: "Error", des: "Please enter the email and password", method: false) {
                self.dismiss(animated: true, completion: nil)
            }
            
        }else if !utill.isValidEmail(testStr: usernameTextField.text!) {
        
            popAlertView(title: "Error", des: "Please enter the a valid email address", method: false) {
                self.dismiss(animated: true, completion: nil)
            }
            
        }else{
            showIndicator()
            loginUser(userName: usernameTextField.text!, pass: passwordTextField.text!)
        }
    }
}
