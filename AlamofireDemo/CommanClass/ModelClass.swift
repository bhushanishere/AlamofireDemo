//
//  RootClass.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on January 4, 2020

import Foundation
import SwiftyJSON


struct ModelClass: Codable {

    var id, profileImage, employeeAge, employeeName, employeeSalary: String

	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON){
        employeeAge = json["employee_age"].stringValue
        employeeName = json["employee_name"].stringValue
        employeeSalary = json["employee_salary"].stringValue
        id = json["id"].stringValue
        profileImage = json["profile_image"].stringValue
	}
}
