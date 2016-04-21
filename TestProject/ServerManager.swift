//
//  ServerManager.swift
//  TestProject
//
//  Created by Evgenii Kievsky on 4/21/16.
//  Copyright © 2016 Evgenii Kievsky. All rights reserved.
//

import UIKit
import AFNetworking

private let _sharedManager = ServerManager()

class ServerManager {
    
    var requestManager = AFHTTPRequestOperationManager()
    var domain = "http://promocode-app.com/api/v1/"
    
    private init() {
    }
    
    class var sharedManager: ServerManager {
        return _sharedManager
    }
    
    func receiveGetDataFor(command:String, parameters:AnyObject?, success:(json: AnyObject) -> Void,
        failure:(json: NSError) -> Void) -> AFHTTPRequestOperation {
        return requestManager.GET(domain + command, parameters: parameters, success: {(operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
            success(json: responseObject)
            }, failure: {(operation: AFHTTPRequestOperation!, error: NSError!) in
                failure(json: error)
        })
    }
    
}
