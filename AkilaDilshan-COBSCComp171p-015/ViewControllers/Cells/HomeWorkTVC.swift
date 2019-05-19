//
//  HomeWorkTVC.swift
//  AkilaDilshan-COBSCComp171p-015
//
//  Created by Akila Dilshan on 5/15/19.
//  Copyright © 2019 Akila Dilshan. All rights reserved.
//

import UIKit

class HomeWorkTVC: UITableViewCell {
    
    //MARK:- UI Outlets
    
    @IBOutlet weak var priorityView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var desLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK:- Functions
    
    func setupCell(title:String, des:String, priority:Priority) {
        
        self.titleLabel.text = title
        self.desLabel.text = des
        
        switch priority {
        case .critical:
            self.priorityView.backgroundColor  = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        case .high:
            self.priorityView.backgroundColor  = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        case .medium:
            self.priorityView.backgroundColor  = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
  
        case .low:
            self.priorityView.backgroundColor  = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        default:
            self.priorityView.backgroundColor  = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            break
        }
    }

}
