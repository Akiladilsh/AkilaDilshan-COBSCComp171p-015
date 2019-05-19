//
//  CustomButton.swift
//  AkilaDilshan-COBSCComp171p-015
//
//  Created by Akila Dilshan on 5/12/19.
//  Copyright © 2019 Akila Dilshan. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let startPointColor:UIColor = #colorLiteral(red: 0.2747275531, green: 0.3485805392, blue: 0.6765411496, alpha: 1)
        let endPointColor:UIColor = #colorLiteral(red: 0.08897475153, green: 0.8562051654, blue: 0.8104103208, alpha: 1)
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [endPointColor.cgColor, startPointColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.cornerRadius = 5
        self.layer.masksToBounds =  false
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
        self.layer.addSublayer(gradientLayer)
        
    }

}
