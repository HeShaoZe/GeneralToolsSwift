//
//  TabBarButton.swift
//  GeneralToolsSwift
//
//  Created by HeShaoZe on 2018/6/15.
//  Copyright © 2018年 HeShaoZe. All rights reserved.
//

import UIKit

class TabBarButton: UIControl {

   // @IBOutlet weak var iconImageButton: UIButton!
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var titleLable: UILabel!
    
    var iconImageArray : Array<Any>!;
    
    
    func loadHeadAndTitle(selectImage : String,normalImage : String, titleText : String)
    {
        self.iconImageView.image = UIImage.init(named: selectImage);
        self.iconImageArray = [selectImage,normalImage];
        self.titleLable.text = titleText;
    }
    
    func isSelectButton(isSelect : Bool)
    {
        if isSelect
        {
            self.titleLable.textColor = UIColor.black;
            let imageName : String = self.iconImageArray[0] as! String;
            self.iconImageView.image = UIImage.init(named: imageName);
        }
        else
        {
            self.titleLable.textColor = UIColor.gray;
            let imageName : String = self.iconImageArray[1] as! String;
            self.iconImageView.image = UIImage.init(named: imageName);
        }
    }
}
