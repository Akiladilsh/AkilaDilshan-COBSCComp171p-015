//
//  HomeWorkVC.swift
//  AkilaDilshan-COBSCComp171p-015
//
//  Created by Akila Dilshan on 5/15/19.
//  Copyright © 2019 Akila Dilshan. All rights reserved.
//

import UIKit

class HomeWorkVC: UIViewController {
    
    //MARK:- UI Outlets
    @IBOutlet weak var homeworkTableView: UITableView!
    
    //MARK:- Variables
    var homeWorkArray:[HomeWork] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNotification()
        setupDataSource()
    
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        retriveUserDefaults()
        homeworkTableView.reloadData()
    }
    
    
    //MARK:- Functions
    
    func setupNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.recordAdded(_:)), name: Notification.Name("recordAdded"), object: nil)
    }
    
    @objc func recordAdded(_ notification: NSNotification) {
        retriveUserDefaults()
      self.homeworkTableView.reloadData()
    }
    
    func popupHomeWorkView()  {
        
        let storyboard = UIStoryboard(name: "Util", bundle: .main)
        
        let homeworkVC = storyboard.instantiateViewController(withIdentifier: "HomeWorkView") as! HomeWorkViewVC
        
        present(homeworkVC, animated: true)
    }
    
    func setupDataSource()  {
        self.homeworkTableView.delegate = self
        self.homeworkTableView.dataSource = self
    }
    
    
    func retriveUserDefaults(){
        if let arrayDetails = HomeWork.getHomeWork(){
            homeWorkArray = arrayDetails
        }
    }
    
    //MARK:- UI Actions
    
    @IBAction func bringUpView(_ sender: Any) {
        popupHomeWorkView()
    }
    

}
extension HomeWorkVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return homeWorkArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:HomeWorkTVC = tableView.dequeueReusableCell(withIdentifier: "homeWCell", for: indexPath) as! HomeWorkTVC
        let data = homeWorkArray[indexPath.row]
        
        cell.setupCell(title: data.title, des: data.des, priority: data.priority)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0.5
        
        UIView.animate(withDuration: 0.75) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1
        }
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, handler) in
            print("Delete Action Tapped")
        }
        deleteAction.backgroundColor = .red
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
    
    
}
