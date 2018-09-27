//
//  ViewController.swift
//  Profiler
//
//  Created by Rahul Rawat on 13/09/18.
//  Copyright © 2018 Rahul Rawat. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

    let myURL = "https://randomuser.me/api"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var imageURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func getPersonTapped(_ sender: Any) {
        Alamofire.request(myURL).responseJSON { (response) in
            let result = response.result
            //print(result)
            
            //CHECK FOR SUCCESS
            
            if let dict = result.value as? Dictionary<String,AnyObject>{
                if let newDict = (dict["results"] as! NSArray)[0] as? Dictionary<String,AnyObject>{
                    if let name = newDict["name"] as? Dictionary<String,AnyObject>{
                        if let firstname = name["first"] as? String{
                            self.nameLabel.text = firstname
                        }
                    }
                    if let webPhone = newDict["phone"] as? String{
                        self.phoneLabel.text = webPhone
                    }
                    if let webemail = newDict["email"] as? String{
                        self.emailLabel.text = webemail
                    }
                }
            }
            
            //GET IMAGE
            if let dict = result.value as? Dictionary<String,AnyObject>{
                if let newDict = (dict["results"] as! NSArray)[0] as? Dictionary<String,AnyObject>{
                    if let photo = newDict["picture"] as? Dictionary<String,AnyObject>{
                        if let webPic = photo["large"] as? String{
                            self.imageURL = webPic
                            
                        }
                    }
                }
            
            
        }
        // Set An Image
            
            if let url = URL(string: self.imageURL){
                if let dataImage = NSData(contentsOf: url){
                    self.imageView.image = UIImage(data: dataImage as Data)
                }
            }
        
    }
    

}

}
