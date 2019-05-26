//
//  FriendTVC.swift
//  AkilaDilshan-COBSCComp171p-015
//
//  Created by Akila Dilshan on 5/14/19.
//  Copyright © 2019 Akila Dilshan. All rights reserved.
//

import UIKit
import Kingfisher


class FriendTVC: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImageView.layer.cornerRadius = profileImageView.bounds.height/2
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupTableCell(firstName:String, lastName:String, cityName:String, picUrl:String)  {
        
        let imageUrl = URL(string: picUrl)
        self.profileImageView.kf.setImage(with: imageUrl)
        self.fullNameLabel.text  = "\(firstName) \(lastName)"
        self.cityNameLabel.text = cityName
    }

}
