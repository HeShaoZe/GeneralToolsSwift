//
//  InterViewModel.swift
//  GeneralToolsSwift
//
//  Created by HeShaoZe on 2018/7/4.
//  Copyright © 2018年 HeShaoZe. All rights reserved.
//

import UIKit

class InterViewModel: NSObject
{
    var titleString : String = "";
    
    func loadModelWithParameter(parameterDict : Dictionary<String, Any>)
    {
        self.titleString = parameterDict["title"] as! String;
    }
    
}
