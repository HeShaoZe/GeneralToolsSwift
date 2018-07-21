//
//  InterViewQuestionWebviewVC.swift
//  GeneralToolsSwift
//
//  Created by hesz on 2018/7/14.
//  Copyright © 2018年 HeShaoZe. All rights reserved.
//

import UIKit

class InterViewQuestionWebviewVC: InterViewBaseViewController {

    
    @IBOutlet var myWebView: UIWebView!
    
    
    var webViewUrl : String = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadMainWebview();
        // Do any additional setup after loading the view.
    }

    func loadMainWebview()
    {
        let url  = URL.init(string: self.webViewUrl);
        print("webViewUrlfdfdfiji---\(self.webViewUrl)");
        self.myWebView.loadRequest(URLRequest.init(url: url!));
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
