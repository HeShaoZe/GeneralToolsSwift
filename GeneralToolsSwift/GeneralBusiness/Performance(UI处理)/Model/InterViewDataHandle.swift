//
//  InterViewDataHandle.swift
//  GeneralToolsSwift
//
//  Created by HeShaoZe on 2018/7/4.
//  Copyright © 2018年 HeShaoZe. All rights reserved.
//

import UIKit

class InterViewDataHandle: NSObject
{
    ///加载本地资源
    func loadFileSourceData() -> Array<Any>
    {
        let storgePath = self.storgePathInterviewFormSandbox();
        print("storgePathffjdfji---\(storgePath)");
        let plistData = NSData.init(contentsOfFile: storgePath);
        
        if plistData?.length != 0
        {
            let interviewArray = NSArray.init(contentsOfFile: storgePath);
            //NSKeyedArchiver.unarchiveObjectWithDat
            if interviewArray?.count != 0
            {
                return interviewArray as! Array<Any>;
            }
        }
        
        let filePath = Bundle.main.path(forResource: "IQSourceData", ofType: "txt");
        let contentStr = try? String.init(contentsOfFile: filePath!, encoding: String.Encoding.utf8);
        
        let strArray = contentStr?.components(separatedBy: "\n")
        
        let arrayCount : Int = (strArray?.count)!;
        
        var resultArray : Array<Any> = [];
        
        for numIndex in  0..<arrayCount
        {
            let contentString = strArray![numIndex];
            print("contentStringdjif---\(contentString)");
            if !contentString.isEmpty
            {
                print("contentStringdjfidjmmf---\(contentString)");
                let strDict : [String : String] = ["title":contentString,"index":"\(numIndex)","content":""];
                resultArray.append(strDict);
            }
        }
        print("resultArraydjfid---\(resultArray)");
        let sandboxPath = self.storgePathInterviewFormSandbox();
        print("sandboxPathjidfj---\(sandboxPath)");
        let fileArray = resultArray as NSArray;
        fileArray.write(toFile: sandboxPath, atomically: true);
        return resultArray;
    }
    
    //获取临时文件夹沙盒本地路径
    func storgePathInterviewFormSandbox() -> String
    {
        let directoryPath = NSTemporaryDirectory()+"PassesStorageDirectory";
        let fileManag = FileManager.default;
        if (!fileManag.fileExists(atPath: directoryPath))
        {
            try? fileManag.createDirectory(atPath: directoryPath, withIntermediateDirectories: true, attributes: nil);
        }
        
        let filePathString = directoryPath + "/" + "InterviewQuestionsFile";
        
        if (!fileManag.fileExists(atPath: filePathString))
        {
            fileManag.createFile(atPath: filePathString, contents: nil, attributes: nil);
        }
        return filePathString;
    }
    
    //根据字典找出字符串
    func findOutStringFrom(paraDict : Dictionary<String, Any>) -> String
    {
        let indexString = paraDict["index"] as! NSString;
        
        let storgePath = self.storgePathInterviewFormSandbox();
        
        let interviewArray : NSArray = NSArray.init(contentsOfFile: storgePath)!;
        
        var contentString : NSString = "";
        
        for index in 0..<interviewArray.count
        {
            let strDict : [String : String] = interviewArray[index] as! [String : String];
            let contentddString = strDict["index"]! as NSString;
            
            if contentddString.isEqual(to: indexString as String)
            {
                contentString = strDict["content"]! as NSString;
                break;
            }
        }
        return contentString as String;
    }
    
    ///写入字符
    func writeDataInInterViewQuestion(paraDict : Dictionary<String, Any>, contentAKString : String)
    {
        let indexString = paraDict["index"] as! NSString;
        
        let storgePath = self.storgePathInterviewFormSandbox();
                
        let contentDcita : NSMutableDictionary = NSMutableDictionary.init(dictionary: paraDict);
        contentDcita.setValue(contentAKString, forKey: "content")
        
        let interviewArray : NSMutableArray = NSMutableArray.init(contentsOfFile: storgePath)!;
        
        for index in 0..<interviewArray.count
        {
            let strDict : [String : String] = interviewArray[index] as! [String : String];
            let contentString = strDict["index"]! as NSString;
            
            if contentString.isEqual(to: indexString as String)
            {
                interviewArray.replaceObject(at: index, with: contentDcita);
                let sandboxPath = self.storgePathInterviewFormSandbox();
                interviewArray.write(toFile: sandboxPath, atomically: true);
                break;
            }
        }
    }
}
