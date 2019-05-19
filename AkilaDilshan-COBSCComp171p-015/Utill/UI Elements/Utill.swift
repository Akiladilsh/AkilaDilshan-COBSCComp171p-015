//
//  File.swift
//  AkilaDilshan-COBSCComp171p-015
//
//  Created by Akila Dilshan on 5/13/19.
//  Copyright © 2019 Akila Dilshan. All rights reserved.
//

import UIKit

class Utill {
    
    func setupTextFields(textFields:[UITextField])  {
        
        let bottomBarColor:UIColor = #colorLiteral(red: 0.264497906, green: 0.5955103636, blue: 0.8485266566, alpha: 1)
        for i in textFields {
            i.borderStyle = .none
            i.layoutIfNeeded()
            let border = CALayer()
            let width = CGFloat(1.0)
            border.borderColor = bottomBarColor.cgColor
            border.frame = CGRect(x: 0, y: i.frame.size.height - width, width:  i.frame.size.width, height: i.frame.size.height)
            border.borderWidth = width
            i.layer.addSublayer(border)
            i.layer.masksToBounds = true
        }
        
    }
    
    //validate emails
    
    func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    
    
    func setupNavigationItem(navigationItem:UINavigationItem){
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func showToast(message : String, view:UIView, width:CGFloat) {
        
        
        let toastLabel = UILabel(frame: CGRect(x: (view.frame.size.width/2) - (width/2), y: view.frame.size.height-100, width: width, height: 35))
        
        toastLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.adjustsFontSizeToFitWidth = true
        toastLabel.font = UIFont(name: "Futura-Medium", size: 15.0)
        toastLabel.text = String(format: "  %@  ", message)
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = toastLabel.frame.size.height/2;
        toastLabel.clipsToBounds  =  true
        view.addSubview(toastLabel)
        UIView.animate(withDuration: 3.0, delay: 0, options: .curveEaseInOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    
}
