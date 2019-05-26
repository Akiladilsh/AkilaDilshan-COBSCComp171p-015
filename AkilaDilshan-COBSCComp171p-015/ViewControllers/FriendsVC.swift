//
//  HomeVC.swift
//  AkilaDilshan-COBSCComp171p-015
//
//  Created by Akila Dilshan on 5/14/19.
//  Copyright © 2019 Akila Dilshan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class FriendsVC: UIViewController {
    
    //MARK:- UI Outlets
    @IBOutlet weak var friendListTableView: UITableView!
    @IBOutlet weak var loadingView: UIView!
    
    
    //MARK:- Variables
    
    //Database Ref
    var ref: DatabaseReference!
    var studentList:[Student] = []
    var passStudent:Student? = nil
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //load friends indicator
        showIndicator()
        
        ref = Database.database().reference()
        setUpTableView()
        getStudentList()
        
    }
    
    //MARK:- Functions
    
    func setUpTableView(){
        
        self.friendListTableView.delegate = self
        self.friendListTableView.dataSource = self
    }
    
    //Get data from firebase
    
    func getStudentList()  {
        self.ref.child("student").observeSingleEvent(of: .value) { (snapshot) in
            //get user value
            
            let value = snapshot.value as? NSDictionary
            var students:[Student] = []
            
            if snapshot.childrenCount > 0 {
                for student in snapshot.children.allObjects as! [DataSnapshot]{
                    
                    let studentObject = student.value as? [String:AnyObject]
                    let student = Student(id: studentObject!["id"] as! String, fName: studentObject!["fName"] as! String, lName: studentObject!["lName"] as! String, city: studentObject!["city"] as! String, gmailUrl: studentObject!["gmail"] as! String, facebookUrl: studentObject!["facebook"] as! String, phoneNum: studentObject!["phoneNum"] as! String, twitterUrl: studentObject!["twitter"] as! String, birthday: studentObject!["birthday"] as! String, age: studentObject!["age"] as! Int, pf: studentObject!["pf"] as! String)
                    
                    students.append(student)
                }
            }
            self.studentList = students
            self.friendListTableView.reloadData()
            self.hideIndicator()
            
        }
    }
    
    
    func showIndicator()  {
        self.loadingView.alpha = 1
        self.view.bringSubviewToFront(self.loadingView)
    }
    
    
    //hide indicator
    
    func hideIndicator(){
        self.loadingView.alpha = 0
        self.view.sendSubviewToBack(self.loadingView)
    }
    
    
    
    
    
    //MARK:- UI Actions
    
    
    
    
   
}

extension FriendsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return studentList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let details = studentList[indexPath.row]
        
        let cell:FriendTVC = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendTVC
        
        cell.selectionStyle = .none
        
        cell.setupTableCell(firstName: details.fName, lastName: details.lName, cityName: details.city, picUrl: details.pf)
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = #colorLiteral(red: 0.08235294118, green: 0.1137254902, blue: 0.1803921569, alpha: 1)
        cell.selectedBackgroundView = bgColorView
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let myButton = UIBarButtonItem()
        myButton.title = ""
        navigationItem.backBarButtonItem = myButton
        passStudent = studentList[indexPath.row]
        performSegue(withIdentifier: "getProfile", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "getProfile"{
            if let nextViewController = segue.destination as? FriendDetailsVC {
               nextViewController.studentObject = passStudent
            }
        }
    }
    
    
    
}
