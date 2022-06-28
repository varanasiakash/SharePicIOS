//
//  ViewController.swift
//  Project_Sharing_App
//
//  Created by student on 28/06/22.
//

import UIKit

class ViewController: UIViewController , UINavigationControllerDelegate, UIImagePickerControllerDelegate
{
    
    @IBOutlet var message1 : UITextField!
    @IBOutlet var urlLink : UITextField!
    @IBOutlet var addImage1 : UIButton!
    @IBOutlet var share : UIButton!
    @IBOutlet var iv1 : UIImageView!
    
    var cameraImagePickerController : UIImagePickerController!
    var photoLibraryPickerController : UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    

    
    @IBAction func addImage()
    {
        let alert = UIAlertController(title: "Add Image", message: "Change option", preferredStyle: UIAlertController.Style.actionSheet)
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default , handler:{ [self]_ in
            if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary))
            {
                self.photoLibraryPickerController = UIImagePickerController()
                photoLibraryPickerController.delegate = self
                photoLibraryPickerController.sourceType = .photoLibrary
                photoLibraryPickerController.allowsEditing = false
                
                self.present(photoLibraryPickerController,animated: true,completion: nil)
                
                
            }
            else
            {
                print("gallery not found in simulator...")
            }
        }))
        
        alert.addAction(UIAlertAction(title: "From Camera", style: .default , handler: { [self]_ in
            if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
            {
                self.self.cameraImagePickerController = UIImagePickerController()
                cameraImagePickerController.delegate = self
                cameraImagePickerController.sourceType = .camera
                cameraImagePickerController.cameraDevice = .rear
                
                self.present(self.cameraImagePickerController,animated: true,completion: nil)
                
                
            }
            else
            {
                print("camera not found in simulator...")
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: {_ in}))
        
    
        self.present(alert, animated: true, completion: nil)
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if picker == photoLibraryPickerController
        {
            print("\(info)")
            
            let image = info[.originalImage]as! UIImage
            iv1.image = image
            
            self.dismiss(animated: true, completion: nil)
        }
        else
        {
            print("\(info)")
            
            let image1 = info[.originalImage]as! UIImage
            iv1.image = image1
            
            self.dismiss(animated: true, completion: nil)
        }
       
    }

    @IBAction func shareClick()
    {
        let shareAll = [message1,urlLink,iv1] as Any
        
        let activityViewController = UIActivityViewController(activityItems: shareAll as! [Any], applicationActivities: nil)
        
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        self.present(activityViewController, animated: true, completion: nil)
    }
}

