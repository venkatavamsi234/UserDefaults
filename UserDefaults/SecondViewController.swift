//
//  SecondViewController.swift
//  UserDefaults
//
//  Created by User on 08/09/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var email_IdLabel: UILabel!
    
    var greetingMessage = ""
    
    var emailId = ""
    
    @IBOutlet weak var displayName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayLabel.text = greetingMessage
        
        email_IdLabel.text = emailId
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.topItem?.title = "Home";
        
        if let name = UserDefaults.standard.string(forKey: "name") {
            
            displayLabel.text = "Hi, \(name) welcome to iOS"
            
        }
        
        if let id = UserDefaults.standard.string(forKey: "id") {
            
            email_IdLabel.text =  id
            
        }
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        
    }
    

    
    @IBAction func redirectingPage(_ sender: UIButton) {
        
        UserDefaults.standard.removeObject(forKey: "name")
        UserDefaults.standard.removeObject(forKey: "id")
        
        
        if let  VC = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            
            navigationController?.pushViewController(VC, animated: true)
        }
    }
    
    
    
    
    
}
