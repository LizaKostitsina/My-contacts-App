//
//  StorageManager.swift
//  Swiftbook TableViewApp
//
//  Created by Костицина Елизавета Константиновна on 22.04.2021.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ contact: Contact) {
        
        try! realm.write {
            realm.add(contact)
        }
    } 
}


