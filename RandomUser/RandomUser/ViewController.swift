//
//  ViewController.swift
//  RandomUser
//
//  Created by Rahul Rawat on 12/09/18.
//  Copyright © 2018 Rahul Rawat. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    var firstname = ""
    var city = ""
    var gender = ""
    var phone = ""
    var email = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = "https://randomuser.me/api"
        Alamofire.request(myURL).responseJSON{(response) in
            //if let JSON = response.result.value{
                //print("JSON\(JSON)")
           // }
            //ABSTRACT DATA FROM JSON
            let result = response.result
            //print(result)
            
            if let dict = result.value as? Dictionary<String,AnyObject>{
                if let innerDictR = (dict["results"] as! NSArray)[0] as? Dictionary<String,AnyObject>{
                    if let webGender = innerDictR["gender"] as? String{
                        self.gender = webGender
                        print("###########")
                        print(self.gender)
                    }
                }
            }
            
            if let dict = result.value as? Dictionary<String,AnyObject>{
                if let newDict = (dict["results"] as! NSArray)[0] as? Dictionary<String,AnyObject>{
                    if let webPhone = newDict["phone"] as? String{
                        self.phone = webPhone
                        print(self.phone)
                    }
                }
            }
            
            if let dict = result.value as? Dictionary<String,AnyObject>{
                if let newDict = (dict["results"] as! NSArray)[0] as? Dictionary<String,AnyObject>{
                    if let webName = newDict["name"] as? Dictionary<String,AnyObject>{
                        if let webfirst = webName["first"] as? String{
                            self.firstname = webfirst
                            print(self.firstname)
                        }
                    }
                }
            }
            
    }



}

}
