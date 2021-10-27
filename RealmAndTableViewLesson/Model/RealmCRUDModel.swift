//
//  RealmCRUDModel.swift
//  RealmAndTableViewLesson
//
//  Created by UrataHiroki on 2021/10/27.
//

import RealmSwift

class RealmCRUDModel{
    
    fileprivate let realmListData = RealmListData()
    open var readResultArray:[[String:String]] = []
    
}


extension RealmCRUDModel{
    
    open func createRealmData(createDate:String?,createSchedule:String?){
        
        guard let date = createDate else { return }
        guard let schedule = createSchedule else { return }
        
        do{
            let realm = try Realm()
            
            let listDatas = RealmListData(value: ["date":date,"schedule":schedule])
            
            try realm.write({
                
                realm.add(listDatas)
            })
            
        }catch{
            
            
        }
        
    }
}
