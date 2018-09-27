//
//  SignupVC.swift
//  LoginApp
//
//  Created by Rahul Rawat on 16/09/18.
//  Copyright © 2018 Rahul Rawat. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignupVC: UIViewController {


    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginTapped(_ sender: Any) {
    }
    @IBAction func signinTapped(_ sender: Any) {
        //displayPopUp(title: "Success", message: "SignUP Successfull")
        if email.text == "" || password.text == ""{
            displayPopUp(title: "Error", message: "Fields cannot be empty")
        }
        else{

            Auth.auth().createUser(withEmail: email.text!, password: password.text!,completion: { (user, error) in
                if error != nil{
                    if let myErr = error?.localizedDescription{
                        self.displayPopUp(title: "ERROR", message: myErr)
                    }
                }
                else{
                    //Enter user value in Database
                    Database.database().reference().child("users").child((user?.user.uid)!).child("email").setValue(self.email.text!)
                    
                    
                    
                    self.displayPopUp(title: "SUCCESS", message: "Successfully Registered")
                }
            })
        }
    }
    

    
    func displayPopUp(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController,animated: true, completion: nil)
    }
    
}
