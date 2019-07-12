//
//  BillListViewController.swift
//  C0751731_MidTerm_MAD3115S2019
//
//  Created by Vijender Singh on 2019-07-12.
//  Copyright © 2019 Shivani Dhiman. All rights reserved.
//

import Foundation
import UIKit

class BillListTableViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    
    
    @IBOutlet weak var users_table: UITableView!
    
    var customerList = [CustomersStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readCustomersPlistFile()
        self.users_table.delegate = self
        self.users_table.dataSource = self
        let button1 = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout(sender:)))
        self.navigationItem.leftBarButtonItem  = button1
        
        self.navigationItem.hidesBackButton = true
        
        self.navigationItem.title = "Home"
        // Do any additional setup after loading the view.
    }
    
    func logout(){
        print("logout")
    }
    
    @objc func logout(sender:UIBarButtonItem!)
    {
        print("logout")
    }
    
    func readCustomersPlistFile(){
        
        let plist = Bundle.main.path(forResource: "customers", ofType: "plist")
        
        if let dict = NSMutableDictionary(contentsOfFile: plist!){
            if let customers = dict["customers"] as? [[String:Any]]
            {
                for customer in customers {
                    let id = customer["customerID"] as! Int
                    let firstName = customer["customerFirstName"] as! String
                    let lastName = customer["customerLastName"] as! String
                    let email = customer["email"] as! String
                    let password = customer["password"] as! String
                    
                    self.customerList.append(CustomersStruct(customerID: id, customerFName: firstName, customerLName: lastName, email: email, password: password))
                }
            }
        }
        
}

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "usersCell")
        
        cell?.textLabel?.text = self.customerList[indexPath.row].fullName
        
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(customerList[indexPath.row].customerFName)
        
        
    }
}

