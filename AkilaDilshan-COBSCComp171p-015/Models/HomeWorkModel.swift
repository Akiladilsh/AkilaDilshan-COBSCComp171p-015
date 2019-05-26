//
//  HomeWork.swift
//  AkilaDilshan-COBSCComp171p-015
//
//  Created by Akila Dilshan on 5/15/19.
//  Copyright © 2019 Akila Dilshan. All rights reserved.
//

import Foundation

class HomeWork: Codable {
    
    var title:String
    var des:String
    var priority:Priority
    
    init(title:String, des:String, priority:Priority) {
        
        self.title = title
        self.des = des
        self.priority = priority
    }
    
    public static func saveHomeWork(homeWork:HomeWork){
        var retrivedHomeWorkArray:[HomeWork] = []
        
        if  let homeWorkData = UserDefaults.standard.data(forKey: "homeworkData"){
             retrivedHomeWorkArray = try! JSONDecoder().decode([HomeWork].self, from: homeWorkData)
        }
        
        
        if retrivedHomeWorkArray.count == 0 {
            
            var homeWorkArray = [HomeWork]()
            homeWorkArray.append(homeWork)
            let homeWorkDat = try! JSONEncoder().encode(homeWorkArray)
            UserDefaults.standard.set(homeWorkDat, forKey: "homeworkData")
        }else{
            
            retrivedHomeWorkArray.append(homeWork)
            let homeWorkDat = try! JSONEncoder().encode(retrivedHomeWorkArray)
            UserDefaults.standard.set(homeWorkDat, forKey: "homeworkData")
            
        }
        
        
    }
    
    public static func deleteHomeWork(deleteHomeWork:HomeWork){
        
        var retrivedHomeWorkArray:[HomeWork] = []
        
        if  let homeWorkData = UserDefaults.standard.data(forKey: "homeworkData"){
            retrivedHomeWorkArray = try! JSONDecoder().decode([HomeWork].self, from: homeWorkData)
        }
        
        for homeWork in retrivedHomeWorkArray{
            
            if ((homeWork.title == deleteHomeWork.title) && (homeWork.des == deleteHomeWork.des) && (homeWork.priority == deleteHomeWork.priority) ){
                let indexOfhomeWork = retrivedHomeWorkArray.firstIndex{$0 === homeWork}
                retrivedHomeWorkArray.remove(at: indexOfhomeWork!)
                
                var retrivedHomeWorkArrayData:[HomeWork] = []
                
                if  let homeWorkData = UserDefaults.standard.data(forKey: "homeworkData"){
                    retrivedHomeWorkArrayData = try! JSONDecoder().decode([HomeWork].self, from: homeWorkData)
                }
                
                if retrivedHomeWorkArrayData.count > retrivedHomeWorkArray.count {
                    
                    let homeWorkDat = try! JSONEncoder().encode(retrivedHomeWorkArray)
                    UserDefaults.standard.set(homeWorkDat, forKey: "homeworkData")
                }
            }
        }
    }
    

    
    
    
    public static func getHomeWork() -> [HomeWork]? {
        
        var homeWorkArray:[HomeWork] = []
        if let homeWorkData = UserDefaults.standard.data(forKey: "homeworkData"){
            homeWorkArray = try! JSONDecoder().decode([HomeWork].self, from: homeWorkData)
        }
        return homeWorkArray
    }
    

    
}

enum Priority:String,Codable {
    
    case critical = "Critical"
    case high = "High"
    case medium = "Medium"
    case low = "Low"
}

