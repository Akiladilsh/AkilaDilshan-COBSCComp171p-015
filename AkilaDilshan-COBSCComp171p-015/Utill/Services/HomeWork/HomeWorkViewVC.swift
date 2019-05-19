//
//  HomeWorkViewVC.swift
//  AkilaDilshan-COBSCComp171p-015
//
//  Created by Akila Dilshan on 5/15/19.
//  Copyright © 2019 Akila Dilshan. All rights reserved.
//

import UIKit

class HomeWorkViewVC: UIViewController {
    
    //MARK:- UI Outlets
    @IBOutlet weak var titleTextF: UITextField!
    @IBOutlet weak var descriptionTxtF: UITextField!
    @IBOutlet weak var ServerityTxtF: UITextField!
    
    //MARK:- Variables
    var utill = Utill()
    let alertService = AlertService()
    var priorityArray:[Priority] = [.critical, .high, .medium, .low]

    override func viewDidLoad() {
        super.viewDidLoad()
        createTypePickers()

        utill.setupTextFields(textFields: [titleTextF, descriptionTxtF, ServerityTxtF])
        // Do any additional setup after loading the view.
    }
    
    
    //MARK:- Functions
    
    func addHomeWork(){
        
    if titleTextF.text!.isEmpty || descriptionTxtF.text!.isEmpty ||  ServerityTxtF.text!.isEmpty {
        
        popAlertView(title: "Error", des:"Please Fill all the fields", method: false, success: false) {
            self.dismiss(animated: true, completion: nil)
        }
        
        }else{
        
        let newHomeWork = HomeWork(title: titleTextF.text!, des: descriptionTxtF.text!, priority: Priority(rawValue: ServerityTxtF.text!)!)
        HomeWork.saveHomeWork(homeWork: newHomeWork)
        NotificationCenter.default.post(name: NSNotification.Name("recordAdded"), object: nil, userInfo:nil)
        utill.showToast(message: "Record added Successfully", view: self.view, width: 350)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.dismiss(animated: true, completion: nil)
        }
        
        }
    }
    
    
    func popAlertView(title:String, des:String, method:Bool, success:Bool, compl:@escaping() -> Void ){
        
        let storyboard = UIStoryboard(name: "Util", bundle: .main)
        
        let alertVC = storyboard.instantiateViewController(withIdentifier: "AlertVC") as! AlertViewVC
        
        if (method == true) {
            alertVC.alertTitle = title
            alertVC.alertBody = des
            alertVC.isDone = false
            alertVC.isSuccess = false
            alertVC.actionButtonTitle = "Done"
            alertVC.buttonAction = compl
            
        } else {
            
            alertVC.alertTitle = title
            alertVC.alertBody = des
            alertVC.isDone = true
            if (success == true){
               alertVC.isSuccess = true
            }else{
               alertVC.isSuccess = false
            }
            
            alertVC.actionButtonTitle = "Done"
            alertVC.buttonAction = compl
        }
        
        
        present(alertVC, animated: true)
    }
    
    //MARK:- UI Actions
    
    @IBAction func cancelTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveHomeWork(_ sender: Any) {
        
        addHomeWork()
        
        
    }
}

extension HomeWorkViewVC: UIPickerViewDataSource,UIPickerViewDelegate{
  
    func createTypePickers()  {
        
        //creation
        let typePicker  = UIPickerView()
        typePicker.delegate = self
        ServerityTxtF.inputView = typePicker
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return priorityArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return priorityArray[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ServerityTxtF.text = priorityArray[row].rawValue
    }
}
