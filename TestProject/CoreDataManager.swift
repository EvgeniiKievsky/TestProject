//
//  CoreDataManager.swift
//  TestProject
//
//  Created by Evgenii Kievsky on 4/21/16.
//  Copyright © 2016 Evgenii Kievsky. All rights reserved.
//

import UIKit
import CoreData

private let _sharedManager = CoreDataManager()

class CoreDataManager {
    var user = NSManagedObject()
  
    
    private init() {
    }
    
    class var sharedManager: CoreDataManager {
        return _sharedManager
    }
    
    func saveUser(user: User) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity =  NSEntityDescription.entityForName("User",
            inManagedObjectContext:managedContext)
        
        let user = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext: managedContext)
        user.setValue(name, forKey: "name")
        
        do {
            try managedContext.save()
            people.append(person)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    
}
