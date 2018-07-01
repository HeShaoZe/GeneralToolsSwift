//
//  ProcessingDataViewController.swift
//  GeneralToolsSwift
//
//  Created by HeShaoZe on 2018/6/13.
//  Copyright © 2018年 HeShaoZe. All rights reserved.
//

import UIKit

class ProcessingDataViewController: UIViewController {

 
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.brown;
        
        
        // Do any additional setup after loading the view.
    }

    
    @IBAction func postRquest(_ sender: Any)
    {
        let dataRequestVC = DataRequestPageVC.init(nibName: "DataRequestPageVC", bundle: nil);
        self.navigationController?.pushViewController(dataRequestVC, animated: true);
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
