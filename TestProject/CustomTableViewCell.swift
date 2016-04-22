//
//  CustomTableViewCell.swift
//  TestProject
//
//  Created by Evgenii Kievsky on 4/22/16.
//  Copyright © 2016 Evgenii Kievsky. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var textsLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var duplicateButton: UIButton!
    
    var index: Int?
    var delegate: CellsHandlingProtocol? = MainViewController()
 
    @IBAction func firstButton(sender: AnyObject) {
        delegate?.addCell(self)
    }
    
    @IBAction func secondButton(sender: AnyObject) {
        delegate?.removeCell(self)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        deleteButtonOptions()
        duplicateButtonOptions()
        pictureOptions()
    }
    
    func deleteButtonOptions() {
        deleteButton.backgroundColor = UIColor.clearColor()
        deleteButton.layer.cornerRadius = 15
        deleteButton.layer.borderWidth = 1
    }
    
    func duplicateButtonOptions() {
        duplicateButton.backgroundColor = UIColor.clearColor()
        duplicateButton.layer.cornerRadius = 15
        duplicateButton.layer.borderWidth = 1
    }
    
    func pictureOptions() {
        picture.layer.borderWidth = 0
        picture.layer.masksToBounds = false
        picture.layer.cornerRadius = 13
        picture.layer.cornerRadius = picture.frame.size.height/2
        picture.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
