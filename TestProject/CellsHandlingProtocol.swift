//
//  CellsHandlingProtocol.swift
//  TestProject
//
//  Created by Evgenii Kievsky on 4/22/16.
//  Copyright © 2016 Evgenii Kievsky. All rights reserved.
//

import UIKit

protocol CellsHandlingProtocol: NSObjectProtocol {

    func addCell(cell: CustomTableViewCell)
    func removeCell(cell: CustomTableViewCell)
    
}
