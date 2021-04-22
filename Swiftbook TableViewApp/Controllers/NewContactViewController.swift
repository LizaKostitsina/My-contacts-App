//
//  NewContactViewController.swift
//  Swiftbook TableViewApp
//
//  Created by Костицина Елизавета Константиновна on 09.04.2021.
//

import UIKit

class NewContactViewController: UITableViewController {

    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var addresstextField: UITextField!
    
    //MARK:ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

        tableView.tableFooterView = UIView()
        saveButton.isEnabled = false
        nameTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }
    
    
    //MARK: TableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            ActionSheets.callActionSheet(vc:self)
        } else {
            view.endEditing(true)
        }
    }
    
    //MARK: Functions
    
    func saveNewContact() {
        
        guard let name = nameTextField.text else { return }
        let imageData = contactImage?.image?.pngData()
        
        let newContact = Contact(name: name, number: numberTextField.text, address: addresstextField.text, imageData: imageData)
        
        //сохраняем в БД
        StorageManager.saveObject(newContact)
    }
    
    //MARK: Navigation
    
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}

//MARK: TextFieldDelegate

extension NewContactViewController: UITextFieldDelegate {
    //Скрываем клавиатуру по нажатию на Done
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //Метод , который срабатывает при редактиривании в текстфилде(addTarget)
    @objc private func textFieldChanged(){
        
        if nameTextField.text != nil {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
}


//MARK: Work with Image
extension NewContactViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        contactImage.image = info[.editedImage] as? UIImage
        contactImage.contentMode = .scaleAspectFill
        contactImage.clipsToBounds = true
        dismiss(animated: true, completion: nil)
    }
}
