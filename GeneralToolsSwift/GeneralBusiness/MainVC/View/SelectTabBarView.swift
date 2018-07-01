//
//  SelectTabBarView.swift
//  GeneralToolsSwift
//
//  Created by HeShaoZe on 2018/6/15.
//  Copyright © 2018年 HeShaoZe. All rights reserved.
//

import UIKit

@objc(SelectTabBarViewDelegate)

protocol SelectTabBarViewDelegate : NSObjectProtocol
{
    func selectTabBarIndexFrom(indexSelect : NSInteger) -> Void;
}

typealias selectBlock = (_ backIndex : NSInteger) -> ();


class SelectTabBarView: UIView
{
    @IBOutlet weak var fristButView: UIView!
    
    @IBOutlet weak var secondButView: UIView!
    
    @IBOutlet weak var threeButView: UIView!
    
    var delegateEvent : SelectTabBarViewDelegate?
    
    var backIndexNum : selectBlock!;
    
    
    func loadMainView()
    {
        let fristBtu : TabBarButton = self.loadTabBarButton();
        fristBtu.loadHeadAndTitle(selectImage: "a28_down.png", normalImage: "a28.png", titleText: "逻辑处理");
        fristBtu.tag = 100;
        fristBtu.addTarget(self, action: #selector(exchangeViewControllerPage(event:)), for: .touchUpInside);
        self.sonViewAutoSuperView(sonView: fristBtu, superView: self.fristButView);
        
        let secondBtu = self.loadTabBarButton();
        secondBtu.loadHeadAndTitle(selectImage: "a21_down.png", normalImage: "a21.png", titleText: "UI处理");
        secondBtu.tag = 101;
        secondBtu.addTarget(self, action: #selector(exchangeViewControllerPage(event:)), for: .touchUpInside);
        self.sonViewAutoSuperView(sonView: secondBtu, superView: self.secondButView);
        
        let threeBtu = self.loadTabBarButton();
        threeBtu.loadHeadAndTitle(selectImage: "a32_down.png", normalImage: "a32.png", titleText: "混合处理");
        threeBtu.tag = 102;
        threeBtu.addTarget(self, action: #selector(exchangeViewControllerPage(event:)), for: .touchUpInside);
        self.sonViewAutoSuperView(sonView: threeBtu, superView: self.threeButView);
        
        ///默认选中的按钮
        self.selectButtonFrom(event: fristBtu);
    }
    
    
    func selectButtonFrom(event : TabBarButton)
    {
        for i in 0..<3
        {
            let indexNum = i + 100;
            let sonView = self.viewWithTag(indexNum) as! TabBarButton;
            sonView.isSelectButton(isSelect: false);
        }
        event.isSelectButton(isSelect: true);
    }
    
    @objc func exchangeViewControllerPage(event : TabBarButton)
    {
        self.selectButtonFrom(event: event);
        if (delegateEvent != nil)
        {
            delegateEvent?.selectTabBarIndexFrom(indexSelect: event.tag - 100);
        }
        
        let indexNum : NSInteger = event.tag - 100;
        self.backIndexNum(indexNum);
    }
    
    func loadTabBarButton() -> TabBarButton
    {
        let fdji : NSArray  = Bundle.main.loadNibNamed("TabBarButton", owner: self, options: nil)! as NSArray;
        print("fdjidjfdi---\(String(describing: fdji))");
        let fristBtu : TabBarButton = Bundle.main.loadNibNamed("TabBarButton", owner: self, options: nil)?.first as! TabBarButton;
        return fristBtu;
    }
    
    func sonViewAutoSuperView(sonView : UIView, superView : UIView)
    {
        superView.addSubview(sonView);
        sonView.translatesAutoresizingMaskIntoConstraints = false;
        //顶度约束
        let topItem : NSLayoutConstraint = NSLayoutConstraint(item: sonView, attribute: .top, relatedBy:.equal, toItem:superView, attribute:.top, multiplier:1.0, constant:0);

        //右边约束
        let rightItem : NSLayoutConstraint = NSLayoutConstraint(item: sonView, attribute: .right, relatedBy:.equal, toItem:superView, attribute: .right, multiplier:1.0, constant:0);

        //底部约束
        let buttomItem : NSLayoutConstraint = NSLayoutConstraint(item: sonView, attribute: .bottom, relatedBy:.equal, toItem:superView, attribute: .bottom, multiplier:1.0, constant:0);

        //左边约束
        let leftItem : NSLayoutConstraint = NSLayoutConstraint(item: sonView, attribute: .left, relatedBy:.equal, toItem:superView, attribute: .left, multiplier:1.0, constant:0);
        
        superView.addConstraints([topItem,rightItem,buttomItem,leftItem]);
    }
}
