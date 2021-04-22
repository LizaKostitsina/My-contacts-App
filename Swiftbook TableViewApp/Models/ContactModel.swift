//
//  ContactModel.swift
//  Swiftbook TableViewApp
//
//  Created by Костицина Елизавета Константиновна on 08.04.2021.
//

import RealmSwift

class Contact : Object {
    
    @objc dynamic var name: String = ""
    @objc dynamic var number: String?
    @objc dynamic var address: String?
    @objc dynamic var imageData: Data?
    
    convenience init(name: String, number: String?, address: String?, imageData: Data?) {
        self.init()
        self.name = name
        self.number = number
        self.address = address
        self.imageData = imageData
    }
}
