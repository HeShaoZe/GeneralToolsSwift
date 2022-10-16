//
//  UIView+ExtensionView.swift
//  GeneralToolsSwift
//
//  Created by Ze Shao on 2022/10/16.
//  Copyright © 2022 HeShaoZe. All rights reserved.
//

import UIKit

extension UIView {

    /// 部分圆角
    ///
    /// - Parameters:
    ///   - corners: 需要实现为圆角的角，可传入多个
    ///   - radii: 圆角半径
    public func corner(byRoundingCorners corners: UIRectCorner, radii: CGFloat) {
        self.layoutIfNeeded()
        superview?.layoutIfNeeded()
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radii, height: radii))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }

    /// View添加渐变
    /// - Parameters:
    ///   - startPoint: 起始点
    ///   - endPoint: 结束点
    ///   - colors: 颜色集
    public func gradientColor(_ startPoint: CGPoint, _ endPoint: CGPoint, _ colors: [UIColor]) {
        guard startPoint.x >= 0, startPoint.x <= 1, startPoint.y >= 0, startPoint.y <= 1, endPoint.x >= 0, endPoint.x <= 1, endPoint.y >= 0, endPoint.y <= 1 else { return }
        removeGradientLayer()
        layoutIfNeeded()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.cornerRadius = layer.cornerRadius
        gradientLayer.masksToBounds = true
        gradientLayer.locations = [0, 1]
        layer.insertSublayer(gradientLayer, at: 0)
    }

    /// 移除渐变
    public func removeGradientLayer() {
        if let sl = self.layer.sublayers {
            for layer in sl {
                if layer.isKind(of: CAGradientLayer.self) {
                    layer.removeFromSuperlayer()
                }
            }
        }
    }
    
    public var x:CGFloat {
        get {
            return self.frame.origin.x
        }
        set(newLeft) {
            var frame = self.frame
            frame.origin.x = newLeft
            self.frame = frame
        }
    }
    
    public var y:CGFloat {
        get {
            return self.frame.origin.y
        }
        
        set(newTop) {
            var frame = self.frame
            frame.origin.y = newTop
            self.frame = frame
        }
    }
    
    public var width:CGFloat {
        get {
            return self.frame.size.width
        }
        
        set(newWidth) {
            var frame = self.frame
            frame.size.width = newWidth
            self.frame = frame
        }
    }
    
    public var height:CGFloat {
        get {
            return self.frame.size.height
        }
        
        set(newHeight) {
            var frame = self.frame
            frame.size.height = newHeight
            self.frame = frame
        }
    }
    
    public var right:CGFloat {
        get {
            return self.x + self.width
        }
    }
    
    public var bottom:CGFloat {
        get {
            return self.y + self.height
        }
    }
    
    public var centerX:CGFloat {
        get {
            return self.center.x
        }
        
        set(newCenterX) {
            var center = self.center
            center.x = newCenterX
            self.center = center
        }
    }
    
    public var centerY:CGFloat {
        get {
            return self.center.y
        }
        
        set(newCenterY) {
            var center = self.center
            center.y = newCenterY
            self.center = center
        }
    }
}

