//
//  TableViewController.swift
//  Swiftbook TableViewApp
//
//  Created by Костицина Елизавета Константиновна on 07.04.2021.
//

import UIKit
import RealmSwift

class TableViewController: UITableViewController {

    
    var contacts : Results<Contact>!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        contacts = realm.objects(Contact.self)
    }

    //MARK: TableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.isEmpty ? 0 : contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        let contact = contacts[indexPath.row]
        
        cell.nameLabel.text = contact.name
        
        cell.photoImage.layer.cornerRadius = cell.frame.size.height / 3
        cell.photoImage.image = UIImage(data: contact.imageData!)
        
        cell.photoImage.clipsToBounds = true
        cell.numberLabel.text = contact.number
        return cell
    }
    
    //MARK: TableViewDelegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 90
    }
    
    //MARK: Navigation
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue){
        guard let newContactVC = segue.source as? NewContactViewController else { return }
        newContactVC.saveNewContact()
        tableView.reloadData()
    }
}


