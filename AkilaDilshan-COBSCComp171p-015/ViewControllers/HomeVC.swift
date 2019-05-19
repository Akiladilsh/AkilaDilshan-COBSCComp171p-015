//
//  HomeVC.swift
//  AkilaDilshan-COBSCComp171p-015
//
//  Created by Akila Dilshan on 5/15/19.
//  Copyright © 2019 Akila Dilshan. All rights reserved.
//

import UIKit
import LocalAuthentication

class HomeVC: UIViewController {
    
    //MARK:- UI Outlets
    
    //MARK:- Variables
    let alertService = AlertService()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavigationBar()
        
    }
    
    //MARK:- Functions
    
    func setUpNavigationBar()  {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "back")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "back")
    }
    
    //authentication Method
    
     func authenticateUser() {
        let myContext = LAContext()
        let myLocalizedReasonString = "NiBM Connect Need Biometrics to Proceed"
        
        var authError: NSError?
        if #available(iOS 8.0, macOS 10.12.1, *) {
            if myContext.canEvaluatePolicy(.deviceOwnerAuthentication, error: &authError) {
                myContext.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: myLocalizedReasonString) { success, evaluateError in
                    
                    DispatchQueue.main.async {
                        if success {
                            // User authenticated successfully, take appropriate action
                            self.performSegue(withIdentifier: "personalDetails", sender: self)
                       
                        } else {
                            
                            let err = evaluateError?.localizedDescription
                            let alertVC = self.alertService.alert(title: "Error", body: err!, buttonTitle: "Try Again", isSuccess: false, isDone: false, completion: {
                                self.authenticateUser()
                                self.dismiss(animated: true, completion: nil)
                                
                            })
                        self.present(alertVC, animated: true)
                        }
                    }
                }
            } else {
                print("Sorry!!.. Could not evaluate policy.")
            }
        } else {
            print("Sorry!!.. Could not evaluate policy.")
        }
    }
    
    
    
    
    
    //MARK:- UI Actions
    @IBAction func getPersonalDetails(_ sender: Any) {
        
        authenticateUser()
        

        
    }
    
    

}
