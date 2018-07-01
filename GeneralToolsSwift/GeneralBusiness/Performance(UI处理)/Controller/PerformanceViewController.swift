//
//  PerformanceViewController.swift
//  GeneralToolsSwift
//
//  Created by HeShaoZe on 2018/6/13.
//  Copyright © 2018年 HeShaoZe. All rights reserved.
//

import UIKit
import PassKit

class PerformanceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func presentAppleWallet(_ sender: Any)
    {
        self.openAppleWalletPage();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func openAppleWalletPage()
    {
        let filePath = Bundle.main.path(forResource: "PassKit-Business-Card", ofType: "pkpass");
        let passData =  NSData.init(contentsOfFile: filePath!);
        var errorP : NSError?;
        let passSource = PKPass.init(data: passData! as Data, error: &errorP);
        
        if ((errorP) != nil)
        {
            print("errorPdjifj---\(String(describing: errorP?.description))");
        }
        
        let passVC = PKAddPassesViewController.init(pass: passSource);
        self.present(passVC, animated: true, completion: nil);
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
