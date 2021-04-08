//
//  TableViewController.swift
//  Swiftbook TableViewApp
//
//  Created by Костицина Елизавета Константиновна on 07.04.2021.
//

import UIKit

class TableViewController: UITableViewController {

    
    let names = [
        
        "Emma Smith","Jessica Jones",
        "James Evans", "Michael Moore",
        "Alexander Miller", "Elizabeth Wilson"
    ]
    
    let numbers = [
        "+(495) 189365" ,"+(495) 892333",
        "+(495) 200321","+(495) 102935",
        "+(495) 2393115","+(495) 109235"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    //MARK: TableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        
        cell.nameLabel.text = names[indexPath.row]
        
        cell.photoImage.layer.cornerRadius = cell.photoImage.frame.height / 7
        cell.photoImage.image = UIImage(named: names[indexPath.row])
        
        cell.numberLabel.text = numbers[indexPath.row]
        return cell
    }
    
    //MARK: TableViewDelegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 90
        
    }
}

    //MARK: Class Cell
class Cell: UITableViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var photoImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
}
