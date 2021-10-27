//
//  ViewController.swift
//  RealmAndTableViewLesson
//
//  Created by UrataHiroki on 2021/10/27.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var scheduleTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let realmCRUDModel = RealmCRUDModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        realmCRUDModel.readRealmData()
       
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
    }

    @IBAction func add(_ sender: Any) {
        
        realmCRUDModel.createRealmData(createDate: dateTextField.text, createSchedule: scheduleTextField.text)
        
        realmCRUDModel.readRealmData()
        tableView.reloadData()
    }
    
}

extension ViewController:UITableViewDelegate{
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 129
    }
}


extension ViewController:UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return realmCRUDModel.readResultArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let cellDateLabel = cell.contentView.viewWithTag(1) as! UILabel
        let cellScheduleLabel = cell.contentView.viewWithTag(2) as! UILabel
        
        cellDateLabel.text = realmCRUDModel.readResultArray[indexPath.row]["readRealmDate"]
        cellScheduleLabel.text = realmCRUDModel.readResultArray[indexPath.row]["readRealmschedule"]
        
        cellDateLabel.layer.cornerRadius = 53.5
        cellDateLabel.layer.masksToBounds = true
        
        return cell
    }
    
    
    
}
