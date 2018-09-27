//
//  ViewController.swift
//  PhotoDetector
//
//  Created by Rahul Rawat on 19/09/18.
//  Copyright © 2018 Rahul Rawat. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var detectedLabel: UILabel!
    @IBOutlet weak var sureLabel: UILabel!
    
    var imagePicker = UIImagePickerController()
    
    var myLib = Resnet50()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func librarySelected(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func cameraSelected(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let ima = info[UIImagePickerControllerOriginalImage] as? UIImage{
        imageView.image = ima
        machineLearning(image: ima)
    }
    picker.dismiss(animated: true, completion: nil)
    }
    
    func machineLearning(image: UIImage){
        if let model = try? VNCoreMLModel(for: myLib.model){
            let req = VNCoreMLRequest(model: model, completionHandler: { (req, error) in
           // Check if error is nil
                if let results = req.results as? [VNClassificationObservation]{
                    for i in results{
                        print("\(i.identifier) and sure: \(i.confidence)")
                    }
                    self.detectedLabel.text = results.first?.identifier
                    self.sureLabel.text = "\((results.first?.confidence)! * 100)%"
                }
    })
        //handler for request
        if let imageData = UIImagePNGRepresentation(image){
            let reqHandler = VNImageRequestHandler(data: imageData, options: [:])
            try? reqHandler.perform([req])
        }
    
}

}
}
