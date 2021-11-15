//
//  LYConvenienceKit
//
//  Copyright (c) 2019-Present LYConvenienceKit Team - https://github.com/liuyik/LYConvenienceKit.git
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import UIKit

public struct LYViewConvenienceFunc {
    
    private let view: UIView
    
    internal init(_ view: UIView) {
        self.view = view
    }
    
    //MARK: - 取得视图转化后的图片(截图)
    ///获取View图片(截图)
    public func getImage() -> UIImage{
        
        UIGraphicsBeginImageContextWithOptions(view.frame.size, false, UIScreen.main.scale)
        
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image!
        
    }
    
    //MARK: - 取得视图所在的控制器
    ///取得视图所在的控制器
    public func viewController()->UIViewController? {
        
        var nextResponder: UIResponder? = view
        
        repeat {
            nextResponder = nextResponder?.next
            
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
            
        } while nextResponder != nil
        
        return nil
    }
    
    //MARK: - 设置视图layer
    ///设置阴影
    public func layerShadow(color:UIColor = .black,
                     offsetSize:CGSize = CGSize(width: 0, height: 0),
                     opacity:Float = 0.1,
                     radius:CGFloat = 5.0) {
        
        view.layer.shadowColor = color.cgColor
        view.layer.shadowOffset = offsetSize
        view.layer.shadowOpacity = opacity
        view.layer.shadowRadius = radius
    }
    

    ///设置部分圆角
    public func layerRoundingCorners(corners:UIRectCorner,radius:CGFloat)
        
    {
        
        let maskPath = UIBezierPath.init(roundedRect: view.bounds,
                                         
                                         byRoundingCorners: corners,
                                         
                                         cornerRadii: CGSize(width: radius, height: radius))
        
        let maskLayer = CAShapeLayer()
        
        maskLayer.frame = view.bounds
        
        maskLayer.path = maskPath.cgPath
        
        view.layer.mask = maskLayer
        
    }
    
    ///边框位置
    public struct LYUIBorderSideType: OptionSet {
        public var rawValue: Int
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        public static var all: LYUIBorderSideType = LYUIBorderSideType(rawValue: 0)
        public static var left: LYUIBorderSideType = LYUIBorderSideType(rawValue: 1 << 0)
        public static var right: LYUIBorderSideType = LYUIBorderSideType(rawValue: 1 << 1)
        public static var top: LYUIBorderSideType = LYUIBorderSideType(rawValue: 1 << 2)
        public static var bottom: LYUIBorderSideType = LYUIBorderSideType(rawValue: 1 << 3)
    }
    
    ///设置部分边框(注意：要先设置视图的frame)
    public func layerBorder(color: UIColor, width: CGFloat, type: LYUIBorderSideType){
        
        if type ==  .all {
            view.layer.borderColor = color.cgColor
            view.layer.borderWidth = width
            return
        }
        
        if type.contains(.left) {
            view.layer.addSublayer(self.addLine(originPoint: CGPoint.zero, toPoint: CGPoint(x: 0, y: view.frame.size.height), color: color, width: width))
        }
        
        if type.contains(.right) {
            view.layer.addSublayer(self.addLine(originPoint: CGPoint(x: view.frame.size.width, y: 0), toPoint: CGPoint(x: view.frame.size.width, y: view.frame.size.height), color: color, width: width))
        }
        
        if type.contains(.top) {
            view.layer.addSublayer(self.addLine(originPoint: CGPoint(x: 0, y: 0), toPoint: CGPoint(x: view.frame.size.width, y: 0), color: color, width: width))
        }
        
        if type.contains(.bottom) {
            view.layer.addSublayer(self.addLine(originPoint: CGPoint(x: 0, y: view.frame.size.height), toPoint: CGPoint(x: view.frame.size.width, y: view.frame.size.height), color: color, width: width))
        }
    }
    
    ///给layer添加线条
    private func addLine(originPoint: CGPoint, toPoint: CGPoint, color: UIColor, width: CGFloat) -> CAShapeLayer {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: originPoint)
        bezierPath.addLine(to: toPoint)
        
        let shapeLayer = CAShapeLayer()
        // 线宽度
        shapeLayer.lineWidth = width;
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        // 添加路径
        shapeLayer.path = bezierPath.cgPath
        return shapeLayer
    }
}
