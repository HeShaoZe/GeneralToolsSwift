//
//  MyCustomAlertView.swift
//  GeneralToolsSwift
//
//  Created by Ze Shao on 2022/10/16.
//  Copyright © 2022 HeShaoZe. All rights reserved.
//

import UIKit
import SnapKit

typealias ConfrimButtonEventBlock = (_ clickButtn : UIButton) ->()
class MyCustomAlertView: UIView {
    
    var isPageDispaly = false
        
    var signDayTitleLab : UILabel?
    
    var dayCollectionView : UICollectionView?
    
    var centerContentView : UIView?
    ///底图
    var backGroundImage : UIImageView?
    
    var centerContentViewW : CGFloat = 341
    
    ///签到按钮
    var sureClickBtn : UIButton?
    
    ///按钮回调
    var noClickButtonBlock: ConfrimButtonEventBlock?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadHeaderContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadHeaderContentView(){
        let delegate  = UIApplication.shared.delegate as? AppDelegate
        self.frame = delegate?.window?.bounds ?? CGRect.init()
        //delegate?.window?.addSubview(self)
                
        let bgview = UIView.init()
        bgview.frame = self.bounds
        bgview.backgroundColor = .black
        bgview.alpha  = 0.6
        self.addSubview(bgview)

        let centerContentView = UIView.init()
        centerContentView.backgroundColor = .white
        //centerContentView.alpha  = 1
        self.addSubview(centerContentView)
        centerContentView.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.centerX.equalTo(self.snp.centerX)
            make.size.equalTo(CGSize(width: 150, height: 150))
        }
        self.centerContentView = centerContentView
        
     
        ///消失按钮
        let signContentClickBtn = UIButton.init()
        signContentClickBtn.setTitle("关闭", for: .normal)
        signContentClickBtn.contentHorizontalAlignment = .center
        signContentClickBtn.addTarget(self, action: #selector(dimissSignInView), for: .touchUpInside)
        self.addSubview(signContentClickBtn)
        signContentClickBtn.snp.makeConstraints { make in
            make.top.equalTo(centerContentView.snp.bottom)
            make.centerX.equalTo(centerContentView.snp.centerX)
            make.size.equalTo(CGSize(width: 50, height: 31))
        }
    }

    
    func showSignInView() {
        self.isPageDispaly = true
        let delegate  = UIApplication.shared.delegate as? AppDelegate
        delegate?.window?.addSubview(self)
    }
    
    @objc func dimissSignInView() {
        self.isPageDispaly = false
        self.removeFromSuperview()
    }
    

}
