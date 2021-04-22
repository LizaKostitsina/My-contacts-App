//
//  ActionSheets.swift
//  Swiftbook TableViewApp
//
//  Created by Костицина Елизавета Константиновна on 14.04.2021.
//

import UIKit
class ActionSheets {
    
    static func chooseImagePicker<T>(source: UIImagePickerController.SourceType, vc: T ) where T : UIViewController, T : UIImagePickerControllerDelegate, T : UINavigationControllerDelegate {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            
            let imagePicker = UIImagePickerController()
            
            imagePicker.delegate = vc
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            vc.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    static func callActionSheet<T>(vc: T) where T : UIViewController, T : UIImagePickerControllerDelegate, T : UINavigationControllerDelegate {
        let cameraIcon = #imageLiteral(resourceName: "camera-2")
        let photoIcon = #imageLiteral(resourceName: "image-gallery")
        
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Camera", style: .default) { _ in
            ActionSheets.chooseImagePicker(source: .camera,vc: vc)
        }
        camera.setValue(cameraIcon, forKey: "image")
        camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        
        let photo = UIAlertAction(title: "Photo", style: .default) {_ in
            
            ActionSheets.chooseImagePicker(source: .photoLibrary,vc: vc)
        }
        photo.setValue(photoIcon, forKey: "image")
        photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        actionSheet.addAction(camera)
        actionSheet.addAction(photo)
        actionSheet.addAction(cancel)
        
        vc.present(actionSheet, animated: true)
    }
}
