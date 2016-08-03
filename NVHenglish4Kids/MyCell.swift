//
//  MyCell.swift
//  NVHenglish4Kids
//
//  Created by Hùng Nguyễn  on 7/26/16.
//  Copyright © 2016 MobileSoftware. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {

    var imgView = UIImageView()
    var contentLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        imgView = UIImageView(frame: CGRectMake(0, 0, 100, 75))
        contentLabel = UILabel(frame: CGRectMake(175,0,100,75))
        
        self.contentView.addSubview(imgView)
        self.contentView.addSubview(contentLabel)

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        imgView = UIImageView(frame: CGRectMake(0, 0, 100, 75))
        contentLabel = UILabel(frame: CGRectMake(175,0,100,75))
        
        self.contentView.addSubview(imgView)
        self.contentView.addSubview(contentLabel)

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
