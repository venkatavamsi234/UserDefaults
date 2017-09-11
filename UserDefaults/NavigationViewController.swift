//
//  NavigationViewController.swift
//  UserDefaults
//
//  Created by User on 08/09/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let name = UserDefaults.standard.string(forKey: "name")
        let id = UserDefaults.standard.string(forKey: "id")
        
        guard  let userName = name, !userName.isEmpty, let email = id, !email.isEmpty  else {
            
            print("User information not available, please go into loginpage.")
            
            return
        }
        
        if let appdelegate = UIApplication.shared.delegate as? AppDelegate {
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            if let secondViewController = mainStoryboard.instantiateViewController(withIdentifier:"SecondViewController") as? SecondViewController {
                let nav = UINavigationController(rootViewController: secondViewController)
                appdelegate.window?.rootViewController = nav
                
            }
            
        }
        
    }
    
}
