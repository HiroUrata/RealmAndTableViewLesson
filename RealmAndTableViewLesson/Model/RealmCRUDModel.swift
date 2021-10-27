//
//  RealmCRUDModel.swift
//  RealmAndTableViewLesson
//
//  Created by UrataHiroki on 2021/10/27.
//

import RealmSwift

class RealmCRUDModel{
    
    fileprivate let realmListData = RealmListData()
    fileprivate let realm = try! Realm()
    
    open var readResultArray:[[String:String]] = []
    
}


extension RealmCRUDModel{
    
    open func createRealmData(createDate:String?,createSchedule:String?){
        
        guard let date = createDate else { return }
        guard let schedule = createSchedule else { return }
        
        do{
            let listDatas = RealmDatas(value: ["date":date,"schedule":schedule])

            try realm.write({
                
                realmListData.dateAndScheduleList.append(listDatas)
                realm.add(realmListData)
            })
            
        }catch{
            
            print("ERROR")
        }
        
    }
}

extension RealmCRUDModel{
    
    open func readRealmData(){
        
        readResultArray = []
            
//        readResultArray = realmListData.dateAndScheduleList.map({["readRealmDate":$0.date,"readRealmschedule":$0.schedule]})
        
        realm.objects(RealmDatas.self).forEach { getDatas in

                readResultArray.append(["readRealmDate":getDatas.date,"readRealmschedule":getDatas.schedule])
        }
        
    }
}
