//
//  PerformanceViewController.swift
//  GeneralToolsSwift
//
//  Created by HeShaoZe on 2018/6/13.
//  Copyright © 2018年 HeShaoZe. All rights reserved.
//

import UIKit
import PassKit

class PerformanceViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var myTableView: UITableView!
    
    var tableDataArray : Array<Any> = [];
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.loadMainView();
        // Do any additional setup after loading the view.
    }
    
    func loadMainView()
    {
        self.myTableView.delegate = self;
        self.myTableView.dataSource = self;
        
        let titleArray = ["打开添加卡片的页面","iOS面试题"];
        self.tableDataArray = titleArray;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    ///打开卡包
    func openAppleWalletPage()
    {
        let filePath = Bundle.main.path(forResource: "PassKit-Business-Card", ofType: "pkpass");
        print("filePathfjdijf---\(String(describing: filePath))----\(filePath?.count)");
        
        if filePath == nil
        {
            return;
        }
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

    ///打开面试题页面
    func openInterViewQuestionPage()
    {
        let interViewPage = InterviewQuestionsVC.init(nibName: "InterviewQuestionsVC", bundle: nil);
        self.navigationController?.pushViewController(interViewPage, animated: true);
    }
    
    ///tableViewDelegate 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.tableDataArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //        var cell : InterViewTitleCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! InterViewTitleCell;
        //print("celldjifj---\(cell)");
        let  cell = Bundle.main.loadNibNamed("InterViewTitleCell", owner: self, options: nil)?.first as! InterViewTitleCell;
        let titleString = self.tableDataArray[indexPath.row];
        cell.interViewTitleLable.text = titleString as? String;
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        let titleString = self.tableDataArray[indexPath.row];
        
        let rowString : NSString = titleString as! NSString;
        
        let attri = [kCTFontAttributeName as NSAttributedStringKey:UIFont.systemFont(ofSize: 18)];
        //let stringSize =  rowString.size(withAttributes: attri);
        let option = NSStringDrawingOptions.usesLineFragmentOrigin;
        let sizeC = CGSize.init(width: self.view.frame.size.width, height: 999)
        let rect : CGRect = rowString.boundingRect(with: sizeC, options: option, attributes: attri, context: nil);
        
        let height = rect.size.height;
        
        if height < 60
        {
            return 60;
        }
        return height + 20;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if indexPath.row == 0
        {
             self.openAppleWalletPage();
        }
        else if indexPath.row == 1
        {
            self.openInterViewQuestionPage();
        }
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
