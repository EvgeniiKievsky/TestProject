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
    
    private init() {
    }
    
    class var sharedManager: CoreDataManager {
        return _sharedManager
    }
    
    lazy var managedObjectContext : NSManagedObjectContext? = {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        return appDelegate.managedObjectContext
    }()
    
    func save() {
        print("CORE DATA LOG : SAVE CONTEXT")
        do {
            try managedObjectContext!.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
}
