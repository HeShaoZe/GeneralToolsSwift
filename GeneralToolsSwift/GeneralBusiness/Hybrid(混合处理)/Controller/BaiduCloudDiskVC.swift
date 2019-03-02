//
//  BaiduCloudDiskVC.swift
//  GeneralToolsSwift
//
//  Created by hesz on 2018/7/8.
//  Copyright © 2018年 HeShaoZe. All rights reserved.
//

import UIKit

class BaiduCloudDiskVC: UIViewController {

    
    @IBOutlet var myWebView: UIWebView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.loadMainUIView();
        // Do any additional setup after loading the view.
    }
    
    
    func loadMainUIView()
    {
        let dataUrl = URL.init(string: "https://www.baidu.com");
        let urlRequestT = URLRequest.init(url: dataUrl!);
        self.myWebView.loadRequest(urlRequestT);
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
