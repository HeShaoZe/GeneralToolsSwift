//
//  HengNoficationView.swift
//  GeneralToolsSwift
//
//  Created by Ze Shao on 2022/10/16.
//  Copyright © 2022 HeShaoZe. All rights reserved.
//

import UIKit

class HengNoficationView: UIView {

    var noticeView : UIView?
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.perform(#selector(self.loadHeaderContentView), with: nil, afterDelay: TimeInterval(1.0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func loadHeaderContentView() {
        let noticeSpe = 16.0
        let noticeViewW = self.width - noticeSpe * 2
        let noticeViewX = -noticeViewW
        let noticeView = UIView.init(frame: CGRect(x: noticeViewX, y: 50, width: noticeViewW, height: 40))
        noticeView.backgroundColor = .orange
        noticeView.layer.cornerRadius = 10.0
        self.addSubview(noticeView)
        self.noticeView = noticeView
        
        UIView.animate(withDuration: 1.0) {
            let noticeViewX = noticeSpe
            noticeView.x = noticeViewX
        } completion: { Boolisbood in
            var timeNum : Int = 2
   
            self.perform(#selector(self.removeSonViewAination), with: nil, afterDelay: TimeInterval(timeNum))
        }
    }
    
    
    @objc func removeSonViewAination() {
        UIView.animate(withDuration: 1.0) {
            self.noticeView?.x = self.width
        } completion: { Boolisbood in
            self.noticeView?.removeFromSuperview()
            self.removeFromSuperview()
        }
    }

}
