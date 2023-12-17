//
//  Deneme.swift
//  instgaramCloneFurkanSabaz
//
//  Created by Murat Gules on 16.12.2023.
//

import UIKit

class MyImagePickerController {
    
    let viewController: UIViewController
    init(viewController: UIViewController){
        self.viewController = viewController
    }
    
    func showImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = viewController as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        imagePicker.sourceType = .photoLibrary // Veya .camera kullanarak fotoğraf çekme
        viewController.present(imagePicker, animated: true, completion: nil)
    }
    
    // Diğer metotlar ve işlevsellikler buraya eklenir
}

