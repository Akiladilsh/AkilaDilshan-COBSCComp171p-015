//
//  AlertViewVC.swift
//  AkilaDilshan-COBSCComp171p-015
//
//  Created by Akila Dilshan on 5/15/19.
//  Copyright © 2019 Akila Dilshan. All rights reserved.
//

import UIKit

class AlertViewVC: UIViewController {
    
    //MARK:- UI Outlets
    
    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var sucessButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var buttonArray: UIStackView!
    
    //MARK:- Variables
    
    var alertTitle = String()
    var alertBody = String()
    var actionButtonTitle = String()
    var isSuccess = Bool()
    var isDone = Bool()
    var buttonAction: (() -> Void)?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()

    }
    
    //MARK:- Functions
    
    func setupView() {
        
        titleLabel.text = alertTitle
        descriptionLabel.text = alertBody
        sucessButton.setTitle(actionButtonTitle, for: .normal)
        if isSuccess {
            self.statusImageView.image = #imageLiteral(resourceName: "sucess")
        }else{
           self.statusImageView.image = #imageLiteral(resourceName: "faliure")
        }
        if isDone {
            buttonArray.removeArrangedSubview(cancelButton)
        }
    }
    
    
    //MARK:- UI Actions
    @IBAction func cancelTap(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    

    @IBAction func actionTap(_ sender: Any) {
        
        buttonAction?()
    }
}
