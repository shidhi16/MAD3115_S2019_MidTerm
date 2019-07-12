//
//  ViewController.swift
//  C0751731_MidTerm_MAD3115S2019
//
//  Created by Vijender Singh on 2019-07-11.
//  Copyright © 2019 Shivani Dhiman. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var email_txt: UITextField!
    @IBOutlet weak var password_txt: UITextField!
    @IBOutlet weak var rememberMe_switch: UISwitch!
    @IBOutlet weak var login_btn: UIButton!
    
    var customerDict = [CustomersStruct]()
    
        let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rememberMe_switch.isOn = false
        getRememberMe()
        readCustomersPlistFile()
    
    }
    @IBAction func login_btn(_ sender: UIBarButtonItem) {
        if let email = email_txt.text{
            if !email.isEmpty{
                
                if email.isValidEmail(){
                    if let password = password_txt.text{
                        if !password.isEmpty{
                            if password.sizeCheck(){
                                
                                if  checkEmailPassword(email: email, password: password) {
                                    
                                }else{
                                    showAlertBox(msg: "Incorrect Credentials")
                                }
                                
                            }else{
                                showAlertBox(msg: "Password Invalid")
                            }
                            
                        }else{
                            showAlertBox(msg: "Enter Password")
                        }
                    }
                }
                else{
                    showAlertBox(msg: "Enter Valid Password")
                }
            }else{
                showAlertBox(msg: "Enter User Email")
            }
        }
        
    }
    
    func showAlertBox(msg : String)  {
        let alertController = UIAlertController(title: "CustomerBillApp", message:
            msg, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    func readCustomersPlistFile(){
        
        let plist = Bundle.main.path(forResource: "UserInfo", ofType: "plist")
        
        if let dict = NSMutableDictionary(contentsOfFile: plist!){
            if let customers = dict["customers"] as? [[String:Any]]
            {
                for customer in customers {
                    let id = customer["customerID"] as! Int
                    let firstName = customer["customerFirstName"] as! String
                    let lastName = customer["customerLastName"] as! String
                    let email = customer["email"] as! String
                    let password = customer["password"] as! String
                    
                    self.customerDict.append(CustomersStruct(customerID: id, customerFName: firstName, customerLName: lastName, email: email, password: password))
                }
            }
        }
        
    }

    }
    func checkEmailPassword(email : String , password : String) -> Bool{
        
        for eachCustomer in customerDict{
            if (eachCustomer.email == email && eachCustomer.password == password) {
                return true
            }
        }
        return false
    }

/*
 func setRememberMe()  {
    if rememberMe_switch.isOn {
        userDefault.set(self.email_txt.text, forKey: "User Email")
        userDefault.set(self.password_txt.text, forKey: "User Password")
    }else{
        userDefault.set("", forKey: "User Email")
        userDefault.set("", forKey: "User Password")
    }
}

private func getRememberMe()
{
    let userDefault = UserDefaults.standard
    
    if let email = userDefault.string(forKey: "User Email")
    {
        email_txt.text = email
        
        if let password = userDefault.string(forKey: "User Password")
        {
            password_txt.text = password
            rememberMe_switch.setOn(true, animated: false)
        }
}
*/
