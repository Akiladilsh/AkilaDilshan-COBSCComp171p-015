//
//  AlertService.swift
//  AkilaDilshan-COBSCComp171p-015
//
//  Created by Akila Dilshan on 5/15/19.
//  Copyright © 2019 Akila Dilshan. All rights reserved.
//

import UIKit

class AlertService {
    
    func alert(title:String, body:String, buttonTitle:String, isSuccess:Bool, isDone:Bool, completion: @escaping() -> Void) -> AlertViewVC {
        
        let storyboard = UIStoryboard(name: "Util", bundle: .main)
        
        let alertVC = storyboard.instantiateViewController(withIdentifier: "AlertVC") as! AlertViewVC
        
        alertVC.alertTitle = title
        alertVC.alertBody = body
        alertVC.actionButtonTitle = buttonTitle
        alertVC.isSuccess = isSuccess
        alertVC.isDone = isDone
        
        alertVC.buttonAction = completion
        
        
        return alertVC
    }
    

}

