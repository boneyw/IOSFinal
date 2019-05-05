//
//  photoSelection.swift
//  Animations
//
//  Created by william boney on 4/20/19.
//  Copyright © 2019 YiGu. All rights reserved.
//

import UIKit

class photoSelection: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var Camera: UIButton!
    @IBOutlet weak var PhotoLibrary: UIButton!
    @IBOutlet weak var ImageDisplay: UIImageView!
    @IBOutlet weak var Next: UIButton!
    
    var imageName: UIImageView!
    let imagePicker = UIImagePickerController()
    
    // MOve to the next screen to setup picture
     func prepareForSegue(segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! ViewController
        vc.received = self.imageName
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        self.imageName = ImageDisplay

        // Do any additional setup after loading the view.
    }
    // Open the camera on the phone
    @IBAction func CameraAction(_ sender: UIButton) {
        
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.sourceType = .camera
        
        present(picker, animated: true, completion: nil)
        
    }
    // Opening the photo library to llok at the picture you have
    @IBAction func PhotoLibraryAction(_ sender: UIButton) {
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
}
// how to choose what in the library 
extension photoSelection {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            ImageDisplay.image = image
            
        }
        dismiss(animated: true, completion: nil)
    }
}
