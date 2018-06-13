//
//  MainViewController.swift
//  GeneralToolsSwift
//
//  Created by hesz on 2018/6/13.
//  Copyright © 2018年 HSZ. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad()
    {
        super.viewDidLoad()

        
        self.loadMainViewController();
        
        // Do any additional setup after loading the view.
    }
    
    
    func loadMainViewController()
    {
        let logicalVC = LogicalProcessingVC.init(nibName: "LogicalProcessingVC", bundle: nil);
        logicalVC.title = "逻辑处理";
        let logicalNav = UINavigationController.init(rootViewController: logicalVC);
        
        let performanceVC = PerformanceProcessingVC.init(nibName: "PerformanceProcessingVC", bundle: nil);
        performanceVC.title = "UI处理";
        let performanceNav = UINavigationController.init(rootViewController: performanceVC);
        
        let hybridHandleVC = HybridHandleVC.init(nibName: "HybridHandleVC", bundle: nil);
        hybridHandleVC.title = "混合处理";
        let hybridHandleNav = UINavigationController.init(rootViewController: hybridHandleVC);
        self.viewControllers = [logicalNav,performanceNav,hybridHandleNav];
        
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
