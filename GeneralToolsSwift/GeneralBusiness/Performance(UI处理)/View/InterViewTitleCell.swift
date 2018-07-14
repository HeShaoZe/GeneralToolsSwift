//
//  InterViewTitleCell.swift
//  GeneralToolsSwift
//
//  Created by HeShaoZe on 2018/7/4.
//  Copyright © 2018年 HeShaoZe. All rights reserved.
//

import UIKit

class InterViewTitleCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    @IBOutlet weak var interViewTitleLable: UILabel!
    
    
    func loadMainViewWith(interModel : InterViewModel)
    {
        self.interViewTitleLable.text = interModel.titleString;
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
