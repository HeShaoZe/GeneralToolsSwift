//
//  InterviewQuestionsDetailVC.swift
//  GeneralToolsSwift
//
//  Created by HeShaoZe on 2018/7/4.
//  Copyright © 2018年 HeShaoZe. All rights reserved.
//

import UIKit

class InterviewQuestionsDetailVC: InterViewBaseViewController {

    @IBOutlet weak var oneConStraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var twoConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var textViewBottom: NSLayoutConstraint!
    
    @IBOutlet weak var bgSupView: UIView!
    
    
    
    @IBOutlet weak var myTitleLabel: UILabel!
    
    @IBOutlet weak var myTextView: UITextView!
    
    var tableDictionary : Dictionary<String, Any> = [:];
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.loadMainUIView();
        self.loadRightButton();
        self.loadDetailContentWith(parameterDict: self.tableDictionary);
        self.monitorKeyBordMove();
        //self.view.backgroundColor = UIColor.orange;
    }
    
    override func viewWillAppear( animated: Bool)
    {
        super.viewWillAppear(animated);
        self.hiddenTabBarItem(isHiddenT: true);
    }

    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated);
    }
    
    func loadRightButton()
    {
        let copyBut = self.loadNavigationItemButton(titleString: "复制标题",action: #selector(copyTextTitleAction));
        let editBut = self.loadNavigationItemButton(titleString: "编辑",action: #selector(editTextAction));
        self.navigationItem.rightBarButtonItems = [copyBut,editBut];
    }
    
    func loadMainUIView()
    {
        self.myTextView.isEditable = false;
        self.myTextView.text = nil;
        
        self.myTitleLabel.text = self.tableDictionary["title"] as? String;
        let textTap = UITapGestureRecognizer.init(target: self, action: #selector(keyBoardDownDismiss(_:)))
        self.myTitleLabel.isUserInteractionEnabled = true;
        self.myTitleLabel.addGestureRecognizer(textTap);
    }
    
    ///监听键盘移动
    func monitorKeyBordMove()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow(_:)), name: Notification.Name.UIKeyboardWillShow, object: nil);
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide(_:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func loadNavigationItemButton(titleString : String,action: Selector) -> UIBarButtonItem
    {
        let buttonRect = CGRect.init(x: 0, y: 0, width: 100, height: 44);
        let buton = UIButton.init(frame: buttonRect);
        buton.setTitle(titleString, for: .normal);
        buton.setTitleColor(UIColor.red, for: .normal);
        buton.addTarget(self, action:action , for: UIControlEvents.touchUpInside);
        let rightButItem = UIBarButtonItem.init(customView: buton);
        return rightButItem;
    }
    
    func loadDetailContentWith(parameterDict : Dictionary<String, Any>)
    {
        print("myTextViewdjfidf--\(myTextView)");
        let interViewHandle = InterViewDataHandle.init();
        let conteStr = interViewHandle.findOutStringFrom(paraDict: parameterDict);
        print("conteStrdjifdj----\(conteStr)");
        self.myTextView.text = conteStr;
       // self.tableDictionary = parameterDict as Dictionary<String, Any>;
    }
    
    @objc func editTextAction(button : UIButton)
    {
        button.isSelected =  !button.isSelected;
        self.myTextView.isEditable = button.isSelected;
        if button.isSelected
        {
            button.setTitle("完成编辑", for: .normal);
            button.setTitleColor(UIColor.blue, for: .normal);
        }
        else
        {
            button.setTitle("编辑", for: .normal);
            button.setTitleColor(UIColor.red, for: .normal);
            let interViewHandle = InterViewDataHandle.init();
           // let contentString : NSString = self.myTextView.text! as NSString;
            interViewHandle.writeDataInInterViewQuestion(paraDict: self.tableDictionary, contentAKString: self.myTextView.text);
        }
    }
    
    @objc func copyTextTitleAction(button : UIButton)
    {
        button.setTitle("已复制", for: .normal);
        button.setTitleColor(UIColor.gray, for: .normal);
        UIPasteboard.general.string = self.myTitleLabel.text;
    }
    
    //键盘起来
    @objc func keyBoardWillShow(_ notification : Notification)
    {
        //获取userInfo
      let kbInfo = notification.userInfo
        
        //获取键盘的size
        let kbRect = (kbInfo?[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        //键盘的y偏移量
        let changeY = kbRect.origin.y - self.view.frame.size.height;
        
         //键盘弹出的时间
        let duration = kbInfo?[UIKeyboardAnimationDurationUserInfoKey] as!Double
        
        //界面偏移动画
//        UIView.animate(withDuration: duration)
//        {
        DispatchQueue.main.async {
            
            self.oneConStraint.constant = 0;
            self.twoConstraint.constant = -kbRect.origin.y;
            //self.textViewBottom.constant = -kbRect.origin.y;
            self.view.layoutIfNeeded();
        }
            //self.bgSupView.layoutIfNeeded();
//        };
    }
    
    //键盘消失
    @objc func keyBoardWillHide(_ notification : Notification)
    {
        let kbInfo = notification.userInfo

        let duration = kbInfo?[UIKeyboardAnimationDurationUserInfoKey] as!Double
        
        UIView.animate(withDuration: duration) {
            self.oneConStraint.constant = 0;
            self.twoConstraint.constant = 0;
            self.view.layoutIfNeeded();
        };
    }
    
    @objc func keyBoardDownDismiss(_ keyGestion : UIGestureRecognizer)
    {
        self.myTextView.resignFirstResponder();
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit
    {
        //移除通知
        NotificationCenter.default.removeObserver(self);
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
