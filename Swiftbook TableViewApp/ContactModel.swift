//
//  ContactModel.swift
//  Swiftbook TableViewApp
//
//  Created by Костицина Елизавета Константиновна on 08.04.2021.
//

import Foundation

struct Contact {
    
    var number: String
    var name: String
    var image : String
    
    static  let names = [
            "Emma Smith","Jessica Jones",
            "James Evans", "Michael Moore",
            "Alexander Miller", "Elizabeth Wilson"
      ]
    
    static   let numbers = [
            "+(495) 189365" ,"+(495) 892333",
            "+(495) 200321","+(495) 102935",
            "+(495) 2393115","+(495) 109235"
        ]
    
    static func getContacts() -> [Contact] {
        
        var contacts = [Contact]()
        
        for (index,name) in names.enumerated() {
            contacts.append(Contact(number: numbers[index], name: name, image: name))
        }
        
        return contacts
        
        
    }
}
