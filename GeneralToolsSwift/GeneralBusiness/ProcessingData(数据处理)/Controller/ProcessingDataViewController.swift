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

        //self.view.backgroundColor = UIColor.brown;
        
        
        // Do any additional setup after loading the view.
    }

    
    @IBAction func postRquest(_ sender: Any)
    {
        let dataRequestVC = DataRequestPageVC.init(nibName: "DataRequestPageVC", bundle: nil);
        self.navigationController?.pushViewController(dataRequestVC, animated: true);
    }

    @IBAction func userLogin(_ sender: Any) {
        let userLoginVC = UserLoginViewController.init(nibName: "UserLoginViewController", bundle: nil);
        userLoginVC.modalPresentationStyle = .fullScreen
        self.present(userLoginVC, animated: true) {
            
        }
        //self.navigationController?.pushViewController(userLoginVC, animated: true);
    }
    
    @IBAction func customMyAlertView(_ sender: Any) {
        let signTipView = MyCustomAlertView.init(frame: self.view.bounds)
        signTipView.showSignInView()
    }

    @IBAction func beginMoveNoticeView(_ sender: Any) {
        let noficationview = HengNoficationView.init(frame: CGRectMake(0, 50, self.view.width, self.view.height))
        self.view.addSubview(noficationview)
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
