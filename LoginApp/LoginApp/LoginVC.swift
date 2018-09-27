//
//  LoginVC.swift
//  LoginApp
//
//  Created by Rahul Rawat on 15/09/18.
//  Copyright © 2018 Rahul Rawat. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginVC: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginTapped(_ sender: Any) {
        if email.text == "" || password.text == ""{
            displayPopUp(title: "Error", message: "Fields are Empty")
        }
        else{
            Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
                if error != nil{
                
                if let myErr = error?.localizedDescription{
                    self.displayPopUp(title: "Error", message: myErr)
                }
                }
                else{
                   //  print("########")
                    self.performSegue(withIdentifier: "successsegue", sender: nil)
                }
        }
    }
    
    }
    
    func displayPopUp(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController,animated: true, completion: nil)
    }


}

