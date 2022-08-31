//
//  UserLoginViewController.swift
//  GeneralToolsSwift
//
//  Created by Ze Shao on 2022/8/31.
//  Copyright © 2022 HeShaoZe. All rights reserved.
//

import UIKit

class UserLoginViewController: UIViewController {
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var acountTextField: UITextField!
    
    @IBOutlet weak var passWordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func goBackView(_ sender: Any) {
        self.dismiss(animated: true);
    }
    
    @IBAction func loginEvent(_ sender: Any) {
    }
    
    @IBAction func regsiterEvent(_ sender: Any) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
