//
//  File.swift
//  C0751731_MidTerm_MAD3115S2019
//
//  Created by Vijender Singh on 2019-07-11.
//  Copyright © 2019 Shivani Dhiman. All rights reserved.
//

import Foundation

struct CustomersStruct {
    let customerID : Int
    var customerFName : String
    var customerLName : String
    var email : String
    var password : String
    
    var fullName : String{
        return "\(customerFName ) \(customerLName)"
    }
    
}
