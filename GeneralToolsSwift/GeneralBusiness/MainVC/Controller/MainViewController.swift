//
//  MainViewController.swift
//  GeneralToolsSwift
//
//  Created by HeShaoZe on 2018/6/13.
//  Copyright © 2018年 HeShaoZe. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.loadMainView();
        
        self.setupTabBar();
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated);
        
    }

    func setupTabBar()
    {
        self.tabBar.isHidden = true;
        
        let tabBarViewCD : SelectTabBarView = Bundle.main.loadNibNamed("SelectTabBarView", owner: self, options: nil)?.first as! SelectTabBarView;
        tabBarViewCD.loadMainView();
        tabBarViewCD.delegateEvent = self as? SelectTabBarViewDelegate;
        tabBarViewCD.backgroundColor = UIColor.white;
        tabBarViewCD.backIndexNum = {(indexNumber) in
            print("indexNumberdjifj---\(indexNumber)");
            self.selectedIndex = indexNumber;
        }
        self.view.addSubview(tabBarViewCD);
        self.sonViewAutoSuperView(sonView: tabBarViewCD, superView: self.view);
    }
    
    func sonViewAutoSuperView(sonView : UIView, superView : UIView)
    {
        //superView.addSubview(sonView);
        sonView.translatesAutoresizingMaskIntoConstraints = false;
        //高度约束
        let heightItem : NSLayoutConstraint = NSLayoutConstraint(item: sonView, attribute: .height, relatedBy:.equal, toItem:nil, attribute:.notAnAttribute, multiplier:0, constant:49);
        
        //右边约束
        let rightItem : NSLayoutConstraint = NSLayoutConstraint(item: sonView, attribute: .right, relatedBy:.equal, toItem:superView, attribute: .right, multiplier:1.0, constant:0);
        
        //底部约束
        let buttomItem : NSLayoutConstraint = NSLayoutConstraint(item: sonView, attribute: .bottom, relatedBy:.equal, toItem:superView, attribute: .bottom, multiplier:1.0, constant:0);
        
        //左边约束
        let leftItem : NSLayoutConstraint = NSLayoutConstraint(item: sonView, attribute: .left, relatedBy:.equal, toItem:superView, attribute: .left, multiplier:1.0, constant:0);
        
        sonView.addConstraint(heightItem);
        superView.addConstraints([rightItem,buttomItem,leftItem]);
    }

    
    func loadMainView()
    {
        let imageIcon = UIImage.init(named: "grilIcon");
        
        let processDataVC = ProcessingDataViewController.init(nibName: "ProcessingDataViewController", bundle: nil);
        processDataVC.title = "逻辑处理";
        processDataVC.tabBarItem =  UITabBarItem.init(title:"逻辑处理" , image:imageIcon, tag: 100);////self.customTitleItme(tileName: "逻辑处理",tagNum: 100);
        let processDataNv = UINavigationController.init(rootViewController: processDataVC);
        
        let perfromanceVC = PerformanceViewController.init(nibName: "PerformanceViewController", bundle: nil);
        perfromanceVC.title = "UI处理";
        perfromanceVC.tabBarItem = UITabBarItem.init(title: "UI处理", image: imageIcon, tag: 101);
        let perfromanceNv = UINavigationController.init(rootViewController: perfromanceVC);
        
        let hyVC = HybridViewController.init(nibName: "HybridViewController", bundle: nil);
        hyVC.title = "混合";
        hyVC.tabBarItem = UITabBarItem.init(title: "混合", image: imageIcon, tag: 102);
        let hyNv = UINavigationController.init(rootViewController: hyVC);
        self.viewControllers = [processDataNv,perfromanceNv,hyNv];
    }
    

    func findMainParameters()
    {
        var count : UInt32 = 0;
        
        let myTabbar = UITabBarController.init();
        
        
        let proList = class_copyPropertyList(object_getClass(myTabbar), &count);
        
        print("countfdfdji---\(count)");
        
        for i  in 0..<numericCast(count)
        {
            let property = property_getName(proList![i]);
            print("属性成员:\(String.init(utf8String: property))");
        }
    }
    
   
    
    func exchangeViewControlerPage(button : UIButton)
    {
        let indexNum = button.tag - 100;
        self.selectedIndex = indexNum;
    }
    
    //SelectTabBarViewDelegate
    func selectTabBarIndexFrom(indexSelect : NSInteger)
    {
        print("indexSelectdjfdi---\(indexSelect)");
    }
    
    
    /*//清除tabbarView
     func clearTabbarView()
     {
     self.tabBar.isHidden = true;
     
     let tabbarAK : UITabBar = self.value(forKey: "tabBar") as! UITabBar;
     
     print("tabbarAKjfidf-----\(tabbarAK)");
     tabbarAK.removeFromSuperview();
     
     for count in 0..<self.view.subviews.count
     {
     /*let mavie  = view as! tabbarViewAK;
     print("maviejdifj----\(mavie)");*/
     let tempView = self.view.subviews[count];
     if tempView is UITabBar
     {
     print("viewIsTabBar--\(tempView)");
     tempView.removeFromSuperview();
     tempView.backgroundColor = UIColor.orange;
     }
     else
     {
     tempView.frame = CGRect.init(x: 0, y: 0, width: tempView.frame.size.width, height: tempView.frame.size.height - 49);
     }
     
     print("viewdfdiji----\(tempView)");
     }*/

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
