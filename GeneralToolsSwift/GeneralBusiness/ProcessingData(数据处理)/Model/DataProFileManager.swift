//
//  DataProFileManager.swift
//  GeneralToolsSwift
//
//  Created by HeShaoZe on 2018/6/21.
//  Copyright © 2018年 HeShaoZe. All rights reserved.
//

import UIKit

class DataProFileManager: NSObject
{
    //获取临时文件夹沙盒本地路径
    func getCachesPassesForFilePath() -> String
    {
        let directoryPath = NSTemporaryDirectory()+"PassesStorageDirectory";
        let fileManag = FileManager.default;
        if (!fileManag.fileExists(atPath: directoryPath))
        {
            try? fileManag.createDirectory(atPath: directoryPath, withIntermediateDirectories: true, attributes: nil);
        }
        
        let filePathString = directoryPath + "/" + "PassesStorageFile.list";
        
        if (!fileManag.fileExists(atPath: filePathString))
        {
            fileManag.createFile(atPath: filePathString, contents: nil, attributes: nil);
        }
        return filePathString;
    }
}
