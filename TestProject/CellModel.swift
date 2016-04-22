//
//  CellModel.swift
//  TestProject
//
//  Created by Evgenii Kievsky on 4/22/16.
//  Copyright © 2016 Evgenii Kievsky. All rights reserved.
//

import UIKit

class CellModel {
    
    var picture: UIImage?
    var textsLabel: String?
    var dateLabel: String?
    var costLabel: String?
    
    init(myPicture:UIImage?, myTextLabel:String, myDateLabel:String, myCostLabel:String) {
        picture = myPicture
        textsLabel = myTextLabel
        dateLabel = myDateLabel
        costLabel = myCostLabel
    }


    
}
