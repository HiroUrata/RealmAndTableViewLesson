//
//  RealmDatas.swift
//  RealmAndTableViewLesson
//
//  Created by UrataHiroki on 2021/10/27.
//

import RealmSwift

class RealmDatas:Object{
    
    @objc dynamic var date = String()
    @objc dynamic var schedule = String()
}

class RealmListData:Object{
    
    let dateAndScheduleList = List<RealmDatas>()
    //let scheduleList = List<RealmDatas>()
    
}
