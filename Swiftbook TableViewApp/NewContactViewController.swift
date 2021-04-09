//
//  NewContactViewController.swift
//  Swiftbook TableViewApp
//
//  Created by Костицина Елизавета Константиновна on 09.04.2021.
//

import UIKit

class NewContactViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
    }
    
    //MARK: TableViewDelegate
    //Скрываем клавиатуру при нажатии на экран
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
        } else {
            view.endEditing(true)
        }
    }
}

//MARK: TextFieldDelegate

extension NewContactViewController: UITextFieldDelegate {
    //Скрываем клавиатуру по нажатию на Done
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
