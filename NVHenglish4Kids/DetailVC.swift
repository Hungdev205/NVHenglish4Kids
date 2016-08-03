//
//  DetailVC.swift
//  NVHenglish4Kids
//
//  Created by Hùng Nguyễn  on 7/27/16.
//  Copyright © 2016 MobileSoftware. All rights reserved.
//

import UIKit

class DetailVC: UIViewController ,UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var wordVC: WordVC!
    
    var stringTitle: String!
    var dictData: NSDictionary!
    var arrayKeys: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.tableView.registerClass([WordVC class], forCellReuseIdentifier: "Word")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // them title den NavigationBar
        self.title = stringTitle
        
        self.createDataWithName(stringTitle)
        // registerClass for Cell with indentifier
        self.tableView.registerClass((MyCell.self), forCellReuseIdentifier: "Cell")
    }

   
    // tao du lieu tu file .plist
    func createDataWithName(title: String) {
        var path: String = ""
        switch title {
        case "Fruits":
            path = NSBundle.mainBundle().pathForResource("FruitList", ofType: "plist")!
        case "Animals":
            path = NSBundle.mainBundle().pathForResource("AnimalList", ofType: "plist")!
        case "Colors":
            path = NSBundle.mainBundle().pathForResource("ColorList", ofType: "plist")!
        case "Family":
            path = NSBundle.mainBundle().pathForResource("FamilyList", ofType: "plist")!
        case "Sports":
            path = NSBundle.mainBundle().pathForResource("SportList", ofType: "plist")!
        case "Foods":
            path = NSBundle.mainBundle().pathForResource("FoodList", ofType: "plist")!

        default:
            break
        }
        
        // lay du lieu tu file .plist chuyen vao dictionary
        dictData = NSDictionary(contentsOfFile: path)!
        // lay key trong dictData chuyen vao mang arrayKeys
        arrayKeys = dictData.allKeys
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayKeys.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as? MyCell
        
        let key: String = arrayKeys[indexPath.row] as! String
        cell!.contentLabel.text = key
        cell!.imgView.image = UIImage(named: "\(dictData[key]!)")
        
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if wordVC == nil {
            wordVC = self.storyboard?.instantiateViewControllerWithIdentifier("Word") as! WordVC
        }
        let key: String = arrayKeys[indexPath.row] as! String
        wordVC.wordTitle = key
        wordVC.imageWord = UIImage(named: "\(dictData[key]!)")

        self.navigationController?.pushViewController(wordVC, animated: true)
    }
    
}
