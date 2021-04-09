//
//  TableViewController.swift
//  Swiftbook TableViewApp
//
//  Created by Костицина Елизавета Константиновна on 07.04.2021.
//

import UIKit

class TableViewController: UITableViewController {

    
    let contacts = Contact.getContacts()
    

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    //MARK: TableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        
        cell.nameLabel.text = contacts[indexPath.row].name
        
        cell.photoImage.layer.cornerRadius = cell.photoImage.frame.height / 7
        cell.photoImage.image = UIImage(named: contacts[indexPath.row].image)
        
        cell.numberLabel.text = contacts[indexPath.row].number
        return cell
    }
    
    //MARK: TableViewDelegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 90
        
    }
    
    
    
    @IBAction func cancelAction(_ segue: UIStoryboardSegue){

    }
}

    //MARK: Class Cell
class Cell: UITableViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var photoImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
}
