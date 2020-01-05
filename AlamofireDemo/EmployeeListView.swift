//
//  EmployeeListView.swift
//  AlamofireDemo
//
//  Created by Bhushan  Borse on 05/01/20.
//  Copyright © 2020 Bhushan  Borse. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class EmployeeListView: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet weak var tableViewEmp : UITableView!

    var employeeModel               : [ModelClass] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        getEmployeeDetailsFromServer()
    }
        
    func getEmployeeDetailsFromServer() {
        RestClient().callApi(api: "http://dummy.restapiexample.com/api/v1/employees", completion: { (error, json) in
            if error == nil {
                let empJson = json?.arrayValue
                for item in empJson ?? [] {
                    self.employeeModel.append(ModelClass.init(fromJson: item))
                }
                self.tableViewEmp.reloadData()
            } else {
                RestClient().showAlertView(message: String(describing: error), from: self)
            }
        }, type: "GET", data: nil, isAbsoluteURL: true, headers: nil, isSilent: false)
    }

    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeModel.count
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewEmp.dequeueReusableCell(withIdentifier: "EmployeeViewCell", for: indexPath) as! EmployeeViewCell
        cell.selectionStyle = .none
                
        let employeeObject = employeeModel[indexPath.row]
        cell.NameLabel.text = employeeObject.employeeName
        
        cell.idLabel.text = "Id : \(employeeObject.id)"
        cell.ageLable.text = "Age : \(employeeObject.employeeAge)"
        cell.salaryLable.text = "Salary : \(employeeObject.employeeSalary)"
        return cell
    }
}

