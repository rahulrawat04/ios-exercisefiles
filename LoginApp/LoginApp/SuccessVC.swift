//
//  SuccessVC.swift
//  LoginApp
//
//  Created by Rahul Rawat on 16/09/18.
//  Copyright © 2018 Rahul Rawat. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class SuccessVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storageRef = Storage.storage().reference()
        
        let tempImage = storageRef.child("images/myimage.jpeg")
        
// TO UPLOAD IMAGE
 /*       let image = UIImage(named: "image.jpeg")
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        tempImage.putData(UIImageJPEGRepresentation(image!, 0.2)!, metadata: metadata){ (data, error) in
            if error != nil {
                print(error?.localizedDescription)
            }
            else{
                print("upload done")
            }
    }*/
        
        //TO DOWNLOAD IMAGE
        tempImage.getData(maxSize: 1*1024*1024) { (data, error) in
            if error != nil{
                print(error?.localizedDescription)
            }
            else{
                self.imageView.image = UIImage(data: data!)
            }
        }
        
        

}
}
