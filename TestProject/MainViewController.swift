//
//  MainViewController.swift
//  TestProject
//
//  Created by Evgenii Kievsky on 4/22/16.
//  Copyright © 2016 Evgenii Kievsky. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CellsHandlingProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier: String = "MyXib"
    let cellsQuantity: Int = 1
    var cellsArray = Array<CellModel>()
    let numberOfAttay = 5
    var picsArray : [UIImage?] = [UIImage(named: "ChristRedeemer"),UIImage(named: "TajMahal"),UIImage(named: "MachuPicchu"),UIImage(named: "Petra"),UIImage(named: "PyramidChichenItza"),UIImage(named: "RomanColosseum")]
    var myTextLabelArray : [String] = ["ChristRedeemer", "TajMahal", "MachuPicchu", "Petra", "PyramidChichenItza", "RomanColosseum"]
    var myDateLabelArray : [String] = ["25.12", "13.11", "16.16", "10.10", "11.01", "25.1994"]
    var myCostLabelArray : [String] = ["1", "2", "3", "4", "5", "6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        configureDataForTable()
        // Do any additional setup after loading the view.
    }
    
    func configureDataForTable() {
        for i in 0...numberOfAttay {
            print(i)
            cellsArray.append(CellModel(myPicture: picsArray[i], myTextLabel: myTextLabelArray[i], myDateLabel: myDateLabelArray[i], myCostLabel: myCostLabelArray[i]))
        }
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: CustomTableViewCell = self.tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! CustomTableViewCell
        
        cell.textsLabel.text = self.cellsArray[indexPath.row].textsLabel
        cell.dateLabel.text = self.cellsArray[indexPath.row].dateLabel
        cell.costLabel.text = self.cellsArray[indexPath.row].costLabel
        cell.picture.image = self.cellsArray[indexPath.row].picture
        cell.delegate = self
        cell.index = indexPath.row
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func addCell(cell: CustomTableViewCell) {
        let newObject = CellModel(myPicture: cell.picture.image, myTextLabel: cell.textsLabel.text!, myDateLabel: cell.dateLabel.text!
            , myCostLabel: cell.costLabel.text!)
        cellsArray.insert(newObject, atIndex: cell.index!)
        let range = NSMakeRange(0, self.tableView.numberOfSections)
        let sections = NSIndexSet(indexesInRange: range)
        tableView.reloadSections(sections, withRowAnimation: .Automatic)
    }
    
    func removeCell (cell: CustomTableViewCell) {
        cellsArray.removeAtIndex(cell.index!)
        let range = NSMakeRange(0, self.tableView.numberOfSections)
        let sections = NSIndexSet(indexesInRange: range)
        tableView.reloadSections(sections, withRowAnimation: .Automatic)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
