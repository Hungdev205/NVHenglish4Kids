//
//  WordVC.swift
//  NVHenglish4Kids
//
//  Created by Hùng Nguyễn  on 7/27/16.
//  Copyright © 2016 MobileSoftware. All rights reserved.
//

import UIKit
import AVFoundation

class WordVC: UIViewController {
    
    @IBOutlet weak var imgWord: UIImageView!
    @IBOutlet weak var word: UILabel!
    
    var wordTitle: String!
    var imageWord: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()

        word.text = wordTitle
        imgWord.image = imageWord
        // Do any additional setup after loading the view.
    }

    @IBAction func action_Play(sender: UIButton) {
        
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
