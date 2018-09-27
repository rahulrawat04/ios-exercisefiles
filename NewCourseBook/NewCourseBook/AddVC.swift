//
//  AddVC.swift
//  NewCourseBook
//
//  Created by Rahul Rawat on 06/09/18.
//  Copyright © 2018 Rahul Rawat. All rights reserved.
//

import UIKit
import RealmSwift

class AddVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var existingCourse: Course?
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker = UIImagePickerController()
        
        // Fill View with existingCourse data
        
        if let passedCourse = existingCourse {
            name.text = passedCourse.name
            email.text = passedCourse.email
            price.text = passedCourse.price
            
            if let imageNSData = passedCourse.imageNSData as Data?{
                let image = UIImage(data: imageNSData)
                imageView.image = image
            }
        }
    }

    @IBAction func saveTapped(_ sender: Any) {
        
        var newCourse: Course!
        
        if existingCourse == nil{
            newCourse = Course()
            
            if let name = name.text {
                newCourse.name = name
            }
            if let email = email.text {
                newCourse.email = email
            }
            if let price = price.text {
                newCourse.price = price
            }
            if let image = imageView.image {
                if let nsData = UIImageJPEGRepresentation(image, 0.1) as NSData? {
                    newCourse.imageNSData = nsData
                }
            }
            
            
            
            
            //Write it to database of realm
            let realm = try? Realm()
            try? realm?.write {
                realm?.add(newCourse)
            }
        }
        else {
            //Update
            newCourse = existingCourse
            
            let realm = try? Realm()
            try? realm?.write {
                if let name = name.text{
                    newCourse.name = name
                }
                if let email = email.text{
                    newCourse.email = email
                }
                if let price = price.text{
                    newCourse.price = price
                }
                if let image = imageView.image {
                    if let nsData = UIImageJPEGRepresentation(image, 0.1) as NSData? {
                        newCourse.imageNSData = nsData
                    }
                }
            }
            
        }
        
        
        
        
        
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
    @IBAction func deleteTapped(_ sender: Any) {
        let newCourse = existingCourse!
        let realm = try? Realm()
        try? realm?.write {
            realm?.delete(newCourse)
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func addImageTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        //imagePicker.sourceType = .camera
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let ima = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imageView.image = ima
    }
        
        picker.dismiss(animated: true, completion: nil)
}
    
}
