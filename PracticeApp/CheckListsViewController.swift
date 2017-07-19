//
//  ViewController.swift
//  PracticeApp
//
//  Created by Ramoji L on 3/13/17.
//  Copyright © 2017 Halcyon Technologies. All rights reserved.
//

import UIKit

class CheckListsViewController: UITableViewController {
    
    var isYearPickerVisible = false;

    @IBOutlet weak var yearPickerCell : UITableViewCell!
    @IBOutlet weak var yearPicker : UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView:UITableView,
                            numberOfRowsInSection section: Int) -> Int {
     
        return 101;
    }
    
    override func tableView(_ tableView:UITableView,
                            cellForRowAt indexPath: IndexPath)  -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier:"CheckListItem",for: indexPath)
        
        let label = cell.viewWithTag(1) as! UILabel
        
        if indexPath.row % 5 == 0 {
            label.text = "Walk the dog"
        } else if indexPath.row % 5 == 1 {
            label.text = "Brush my teeth"
        } else if indexPath.row % 5 == 2 {
            label.text = "Learn iOS development"
        } else if indexPath.row % 5 == 3 {
            label.text = "Soccer practice"
        } else if indexPath.row % 5 == 4 {
            label.text = "DatePicker CELL"
        }

        
            if indexPath.row == 4 {
                return yearPickerCell
            } else {
                return cell
            }
        
        
    }
    
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        if indexPath.row  == 4 {
            tableView.deselectRow(at: indexPath, animated: true)
            showDatePicker(atRow:indexPath.row , inSection: indexPath.section)
        }else{
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
    }
    
    
    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 4 {
            return 217.0
        } else {
            return 50.0
        }
    }
    
    
    override func tableView(_ tableView: UITableView,
                            indentationLevelForRowAt indexPath: IndexPath) -> Int {
        var newIndexPath = indexPath
        if indexPath.row == 4 {
            newIndexPath = IndexPath(row: 0, section: indexPath.section)
        }
        return super.tableView(tableView,
                               indentationLevelForRowAt: newIndexPath)
    }
    
    
    func showDatePicker(atRow:Int,inSection:Int){
        isYearPickerVisible = true;
        let indexPathOfDatePicker = IndexPath(row: atRow, section: inSection)
        tableView.insertRows(at: [indexPathOfDatePicker], with: .fade)
    }


}

