//
//  TableViewController.swift
//  Swiftbook TableViewApp
//
//  Created by Костицина Елизавета Константиновна on 07.04.2021.
//

import UIKit

class TableViewController: UITableViewController {

    
    let myContacts = [
        
        "Emma Smith","Jessica Jones",
        "James Evans", "Michael Moore",
        "Alexander Miller", "Elizabeth Wilson"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myContacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        
        cell.nameLabel.text = myContacts[indexPath.row]
        cell.photoImage.image = UIImage(named: myContacts[indexPath.row])
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    
}


class Cell: UITableViewCell {
    
   
    @IBOutlet weak var photoImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
}
