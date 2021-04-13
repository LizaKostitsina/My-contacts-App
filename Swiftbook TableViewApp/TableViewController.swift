//
//  TableViewController.swift
//  Swiftbook TableViewApp
//
//  Created by Костицина Елизавета Константиновна on 07.04.2021.
//

import UIKit

class TableViewController: UITableViewController {

    
    var contacts = Contact.getContacts()
    

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    //MARK: TableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        
        let contact = contacts[indexPath.row]
        cell.nameLabel.text = contact.name
        
        cell.photoImage.layer.cornerRadius = cell.photoImage.frame.size.height / 7
        if contact.image == nil {
            cell.photoImage.image = UIImage(named: contact.contactImage!)
        } else {
            cell.photoImage.image = contact.image
        }
        
        cell.photoImage.clipsToBounds = true
        cell.numberLabel.text = contact.number
        return cell
    }
    
    //MARK: TableViewDelegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 90
        
    }
    
    
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue){
        guard let newContactVC = segue.source as? NewContactViewController else { return }
        newContactVC.saveNewContact()
        contacts.append(newContactVC.newContact!)
        tableView.reloadData()
    }
}

    //MARK: Class Cell
class Cell: UITableViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var photoImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
}
