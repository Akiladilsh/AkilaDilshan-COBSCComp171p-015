//
//  LandingVC.swift
//  AkilaDilshan-COBSCComp171p-015
//
//  Created by Akila Dilshan on 5/16/19.
//  Copyright © 2019 Akila Dilshan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LandingVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        
        
    }
    
    //functions
    
    func setUpNavigationBar()  {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.backIndicatorImage = UIImage()
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        TempAppData.userHandle = Auth.auth().addStateDidChangeListener {(auth, user) in
            
            if user != nil {
                
              self.performSegue(withIdentifier: "goToHomeUser", sender: self)
            }else{
               self.performSegue(withIdentifier: "goToLogin", sender: self)
          
            }
            
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        Auth.auth().removeStateDidChangeListener(TempAppData.userHandle!)
    }
    
}
