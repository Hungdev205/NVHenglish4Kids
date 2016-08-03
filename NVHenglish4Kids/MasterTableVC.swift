//
//  MasterTableVC.swift
//  NVHenglish4Kids
//
//  Created by Hùng Nguyễn  on 7/26/16.
//  Copyright © 2016 MobileSoftware. All rights reserved.
//

import UIKit


class MasterTableVC: UITableViewController {
    
    var dictList = ["Animals":"dog.jpg","Fruits":"apple.jpg","Foods":"food.jpg","Sports":"sport.jpg","Family":"family.jpg","Colors":"color.jpg"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        }

   
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dictList.count
    }

   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
            as! MyCell
        // mang chua key cua dicList
        var arrayKey = Array(dictList.keys)
        
        //
        cell.contentLabel.text = arrayKey[indexPath.row]
        cell.imgView.image = UIImage(named: dictList["\(arrayKey[indexPath.row])"]!)
        return cell
    }
  
    //-----------------------------------------------------------------------
    // chuyen du lieu tu man master sang detail use Segue trong Storyboard
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "ShowDetail") {
            
            let detailVC = segue.destinationViewController as! DetailVC
            let selectedRowIndex: NSIndexPath = self.tableView.indexPathForSelectedRow!
            let selectedCell = self.tableView.cellForRowAtIndexPath(selectedRowIndex)! as? MyCell
            
            detailVC.stringTitle = selectedCell!.contentLabel.text

        }
    }
}
