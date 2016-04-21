//
//  User+CoreDataProperties.swift
//  
//
//  Created by Evgenii Kievsky on 4/21/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension User {

    @NSManaged var token: String?
    @NSManaged var id: NSNumber?
    @NSManaged var firstName: String?
    @NSManaged var lastName: String?
    @NSManaged var userName: String?
    @NSManaged var email: String?
    @NSManaged var address: String?
    @NSManaged var newsLetter: NSNumber?
    @NSManaged var notification: NSNumber?
    @NSManaged var avatar: String?
    
    class func createUser(token: String, id: NSNumber, firstName: String, lastName: String, userName: String, email: String, address: String, newsLetter: NSNumber, notification: NSNumber, avatar: String) -> User {
        let user = User()
        user.token = token
        user.id = id
        user.firstName = firstName
        user.lastName = lastName
        user.userName = userName
        user.email = email
        user.address = address
        user.newsLetter = newsLetter
        user.notification = notification
        user.avatar = avatar
    
        return user
    }
    
    class func addPersonToCache(wholeUserDictionary: Dictionary<String, AnyObject>) -> User {
        //dictionary to core data
        let userPropertyDictionary: Dictionary = wholeUserDictionary["user"] as! Dictionary<String, AnyObject>
        
        let token: String = wholeUserDictionary["token"] as? String ?? "noToken"
        let id: Int = userPropertyDictionary["id"] as! Int
        let firstName: String = userPropertyDictionary["firstName"] as? String ?? "noFirstName"
        let lastName: String = userPropertyDictionary["lastName"] as? String ?? "noLastName"
        let userName: String = userPropertyDictionary["userName"] as? String ?? "noUserName"
        let email: String = userPropertyDictionary["email"] as? String ?? "noEmail"
        let address: String = userPropertyDictionary["adress"] as? String ?? "noAdress"
        let newsLetter: NSNumber = userPropertyDictionary["newsLetter"] as! NSNumber
        let notification: NSNumber = userPropertyDictionary["notification"] as! NSNumber
        let avatar: String = userPropertyDictionary["avatar"] as? String ?? "noAvatar"
        
        let user: User = self.createUser(token, id: id, firstName: firstName, lastName: lastName, userName: userName, email: email, address: address, newsLetter: newsLetter, notification: notification, avatar: avatar)
        return user
    }

}
