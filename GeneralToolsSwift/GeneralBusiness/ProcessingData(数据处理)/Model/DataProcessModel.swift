//
//  DataProcessModel.swift
//  GeneralToolsSwift
//
//  Created by HeShaoZe on 2018/6/21.
//  Copyright © 2018年 HeShaoZe. All rights reserved.
//

import UIKit

protocol DataProcessModelDeleaget
{
    func systemPostRequestResultParameter(resultData : NSData);
    
    func systemPostRequestResultParameterTest();
}

typealias systemPostDataBlock = (_ requestData : NSData) -> Void;

class DataProcessModel: NSObject,URLSessionDelegate
{
    var dataDeleagete : DataProcessModelDeleaget?;
    
    var callBack : systemPostDataBlock?;
    
    
    //系统Post请求
    func systemPostRequest(block : @escaping (_ requestData : NSData) -> Void)
    {
        let param = ["parameterOne":"1234fdff56","parameterTwo":"yinyu"];
        let data = try! JSONSerialization.data(withJSONObject: param, options: JSONSerialization.WritingOptions.prettyPrinted);
        let Str = String(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        var urlString = "https://www.baidu.com"
        let Url = URL.init(string: urlString)
        let request = NSMutableURLRequest.init(url: Url!)
        request.timeoutInterval = 30
        //请求方式，跟OC一样的
        request.httpMethod = "POST"
        request.httpBody = Str?.data(using: String.Encoding.utf8)
        
        let session = URLSession.shared
        let dataTaskAK = session.downloadTask(with: request as URLRequest) { (myUrl, myResponse, errorr) in
            
            print("myResponsejdidfjdi----\(myResponse?.description)");
        }
        dataTaskAK.resume();
        
        
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            print("errorfjdif--------\(error.debugDescription)");
            if (error != nil)
            {
                return
            }
            else
            {
                var json : Any?
                do
                {
                    json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments);
                }
                catch
                {
                    print(error)
                }
                print("jsondjifj----\(json)");
                
                
                let name : AnyClass! = object_getClass(data);
                print("nameljijfdi---\(name)");
                
                let nameString : String = String.init(data: data!, encoding: String.Encoding.utf8)!;
                
                print("nameStringjidfji---\(nameString)");
                
                //省略了错误判断
//                let json = (try! JSONSerialization.jsonObject(with: data, options: .mutableContainers)) as! NSDictionary
//                print("jsonjfidji----\(json)")
    
                let strData  = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers);
                print("strDatadfjfij---\(String(describing: strData))");
                
                
                
                let array = try? JSONSerialization.jsonObject(with: data!, options: []) as? [[String: AnyObject]];
                
                let stringaa = NSString.init(data: data!, encoding: String.Encoding.utf8.rawValue);//(data: data!, encoding: String.Encoding.utf8.rawValue)
                print("arrayjdijfi---\(stringaa))");
                
                print("datajdifjdi---\(String(describing: data?.description))");
                let dataProFileManager = DataProFileManager.init();
                let pathString = dataProFileManager.getCachesPassesForFilePath();
                print("pathStringjdifjdi----\(pathString)");
                let urlStr = NSURL.init(string: pathString);
                try? data?.write(to: urlStr! as URL);
                
//                let dataDict
                
                
                let arraytt : NSMutableArray = NSMutableArray.init();
                arraytt.add(data);
                arraytt.write(toFile: pathString, atomically: true)
                
                block(data! as NSData);
            }
        }
        dataTask.resume();
    }
}
