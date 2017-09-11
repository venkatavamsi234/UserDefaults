//
//  ViewController.swift
//  UserDefaults
//
//  Created by User on 08/09/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var email_Id: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "hi"
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        label.text = "Login Page"
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func loginMethod(_ sender: Any) {
        
        guard let tempUserName = userName.text, !tempUserName.isEmpty, let provideEmailId = email_Id.text, isValidEmailAddress(emailAddress: provideEmailId) else {
            
            return label.text = "Please Enter Valid Credentials "
            
        }
        
        let userDefault = UserDefaults.standard
        userDefault.set(tempUserName, forKey: "name")
        userDefault.set(provideEmailId, forKey: "id")
        
        UserDefaults.standard.synchronize()
        
    
        if let  myVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            
            myVC.greetingMessage = ("Hi \(tempUserName), welcome to iOS")
            
            myVC.emailId = provideEmailId
            
            navigationController?.pushViewController(myVC, animated: true)
        }
    }
    
    func isValidEmailAddress(emailAddress: String?) -> Bool {
        
        guard let emailId = emailAddress, !emailId.isEmpty else {
            return false
        }
        
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: emailAddress)
        
    }
}

