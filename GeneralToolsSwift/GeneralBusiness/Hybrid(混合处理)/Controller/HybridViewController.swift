//
//  HybridViewController.swift
//  GeneralToolsSwift
//
//  Created by HeShaoZe on 2018/6/13.
//  Copyright © 2018年 HeShaoZe. All rights reserved.
//

import UIKit

class HybridViewController: UIViewController {


    @IBAction func startLoadWebView(_ sender: Any)
    {
        let baiduVC = BaiduCloudDiskVC.init(nibName: "BaiduCloudDiskVC", bundle: nil);
        self.navigationController?.pushViewController(baiduVC, animated: true);
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
