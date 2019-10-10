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
import SnapKit

extension LYViewConvenience where Self: UIView {
     
    ///添加到父视图
    @discardableResult public
    func addToSuperView(_ superV:UIView) -> Self {
        
        superV.addSubview(self)
        
        return self
    }
    
    ///加约束
    @discardableResult  public
    func layout(_ superV:UIView, snapMaker: (ConstraintMaker) ->Void) -> Self {
        
        superV.addSubview(self)
        self.snp.makeConstraints { (make) in
            snapMaker(make)
        }
        return self
    }
    
    ///设置背景颜色
    @discardableResult  public
    func backgroundColor(_ color:UIColor) -> Self{
        self.backgroundColor = color
        return self
    }
    
    ///设置边框
    @discardableResult  public
    func layerBorder(_ bWidth:CGFloat = 1,
                     _ bColor:UIColor = #colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8509803922, alpha: 1)) ->Self{
    
        layer.borderColor = bColor.cgColor
        layer.borderWidth = bWidth
        
        return self
    }
    
    ///设置圆角
    @discardableResult  public
    func layerRadius(_ radius:CGFloat = 5,
                     _ isMasks:Bool = false) -> Self{
        
        layer.cornerRadius = radius
        layer.masksToBounds = isMasks
        return self
    }
    
    ///设置填充模式
    @discardableResult  public
    func contentMode(_ mode:UIView.ContentMode) -> Self{
        contentMode = mode
        return self
    }
    
    //是否能点击
    @discardableResult  public
    func userEnabled(_ isEnable:Bool = false) -> Self{
        isUserInteractionEnabled = isEnable
        return self
    }
    
    ///是否隐藏
    @discardableResult  public
    func hidden(_ isHid:Bool = true) -> Self {
        isHidden = isHid
        return self
    }
    
    ///添加点击事件
    @discardableResult  public
    func addTarget(target: Any?, action: Selector?)-> Self{
        isUserInteractionEnabled = true
        addGestureRecognizer(UITapGestureRecognizer(target: target, action: action))
        return self
    }
}


