//
//  InterViewBaseViewController.swift
//  GeneralToolsSwift
//
//  Created by hesz on 2018/7/14.
//  Copyright © 2018年 HeShaoZe. All rights reserved.
//

import UIKit

class InterViewBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated);
        self.hiddenTabBarItem(isHiddenT: true);
    }
    
    func hiddenTabBarItem(isHiddenT : Bool)
    {
        let appDelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate;
        let mainVC : MainViewController = appDelegate.window?.rootViewController as! MainViewController;
        mainVC.shouldHiddenTabbar(isHidden: isHiddenT);
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
