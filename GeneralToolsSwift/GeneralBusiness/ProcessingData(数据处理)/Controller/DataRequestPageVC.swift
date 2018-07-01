//
//  DataRequestPageVC.swift
//  GeneralToolsSwift
//
//  Created by HeShaoZe on 2018/6/20.
//  Copyright © 2018年 HeShaoZe. All rights reserved.
//

import UIKit

class DataRequestPageVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //系统Post请求
    @IBAction func systemPostRequest(_ sender: Any)
    {
        let dataProcess = DataProcessModel.init();
        dataProcess.systemPostRequest { (requestData) in
            let strData  = try? JSONSerialization.jsonObject(with: requestData as Data, options: .mutableContainers);
            print("strDatajfidfjdif---\(String(describing: strData))");
        };
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
