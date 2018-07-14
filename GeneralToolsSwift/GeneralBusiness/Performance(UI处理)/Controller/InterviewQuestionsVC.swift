//
//  InterviewQuestionsVC.swift
//  GeneralToolsSwift
//
//  Created by HeShaoZe on 2018/7/4.
//  Copyright © 2018年 HeShaoZe. All rights reserved.
//

import UIKit

class InterviewQuestionsVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
 
    @IBOutlet weak var myTableView: UITableView!
    
    var tableDataArray : Array<Any> = [];
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.loadMainView();
        self.loadTableSourceData();
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated);
        self.hiddenTabBarItem(isHiddenT: true);
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated);
        self.hiddenTabBarItem(isHiddenT: false);
    }
    
    func hiddenTabBarItem(isHiddenT : Bool)
    {
        let appDelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate;
        let mainVC : MainViewController = appDelegate.window?.rootViewController as! MainViewController;
        mainVC.shouldHiddenTabbar(isHidden: isHiddenT);
    }
    
    func loadMainView()
    {
        self.myTableView.delegate = self;
        self.myTableView.dataSource = self;
    }
    
    func loadTableSourceData()
    {
        let interviewHandle = InterViewDataHandle.init();
        self.tableDataArray = interviewHandle.loadFileSourceData();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    ///UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.tableDataArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
//        var cell : InterViewTitleCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! InterViewTitleCell;
        //print("celldjifj---\(cell)");
        let  cell = Bundle.main.loadNibNamed("InterViewTitleCell", owner: self, options: nil)?.first as! InterViewTitleCell;
        
        let dataDcit = self.tableDataArray[indexPath.row];
        let interModel = InterViewModel.init();
        interModel.loadModelWithParameter(parameterDict: dataDcit as! Dictionary<String, Any>);
        cell.loadMainViewWith(interModel: interModel);
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        let dataDcit = self.tableDataArray[indexPath.row] as! NSDictionary;
    
        let rowString : NSString = dataDcit["title"] as! NSString;
        
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
        let dataDcit = self.tableDataArray[indexPath.row] as! NSDictionary;
        let interDetailVC = InterviewQuestionsDetailVC.init(nibName: "InterviewQuestionsDetailVC", bundle: nil);
        interDetailVC.tableDictionary = dataDcit as! Dictionary<String, Any>;
        //interDetailVC.loadDetailContentWith(parameterDict: dataDcit as! Dictionary<String, Any>);
        self.navigationController?.pushViewController(interDetailVC, animated: true);
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
