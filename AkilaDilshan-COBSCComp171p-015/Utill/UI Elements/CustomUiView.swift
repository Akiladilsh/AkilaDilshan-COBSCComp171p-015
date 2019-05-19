//
//  CustomUiView.swift
//  AkilaDilshan-COBSCComp171p-015
//
//  Created by Akila Dilshan on 5/12/19.
//  Copyright © 2019 Akila Dilshan. All rights reserved.
//

import UIKit

class CustomUiView: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.masksToBounds =  false
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
        self.layer.cornerRadius = 15
    }
}
