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

extension LYViewConvenience where Self: UITextField {
       
    ///delegate
    @discardableResult public
    func delegate(_ target: Any?) -> Self{
        delegate = target as? UITextFieldDelegate
        return self
    }
    
    ///设置提示文字
    @discardableResult public
    func placeholder(_ placeholder:String?) -> Self{
        self.placeholder = placeholder
        return self
    }
    
    ///设置文字
    @discardableResult public
    func text(_ text:String?) -> Self{
        self.text = text
        return self
    }
    
    ///设置属性文本
    @discardableResult public
    func attributedText(_ attributedString:NSAttributedString?) -> Self {
        attributedText = attributedString
        return self
    }
    
    ///设置字体
    @discardableResult public
    func font(_ font:CGFloat) -> Self{
        self.font = UIFont.systemFont(ofSize: font)
        return self
    }
    
    ///设置粗字体
    @discardableResult public
    func boldFont(_ font:CGFloat) -> Self{
        self.font = UIFont.boldSystemFont(ofSize: font)
        return self
    }
    
    ///设置文字颜色
    @discardableResult public
    func textColor(_ color:UIColor) -> Self {
        self.textColor = color
        return self
    }
    
    ///设置密文输入
    @discardableResult public
    func secureTextEntry(_ isSecure:Bool = true) -> Self {
        self.isSecureTextEntry = isSecure
        return self
    }
    
    ///设置键盘样式
    @discardableResult public
    func keyboardType(_ keyboardType:UIKeyboardType) -> Self {
        self.keyboardType = keyboardType
        return self
    }
    
    ///添加左边视图； v=nil时，w为文字到左边的距离
    @discardableResult public
    func addLeftRetractView(_ w:CGFloat=10,view:UIView?=nil) -> Self {
        if view != nil {
            leftView = view
        }else if w>0 {
            leftView = UIView(frame: CGRect(x: 0, y: 0, width: w, height: 0))
        }
        leftViewMode = .always
        
        return self
    }
    
    ///添加右边视图；v=nil时，w为文字到右边的距离
    @discardableResult public
    func addRightRetractView(_ w:CGFloat=10,view:UIView?=nil) -> Self {
        if view != nil {
            rightView = view
        }else if w>0 {
            rightView = UIView(frame: CGRect(x: 0, y: 0, width: w, height: 0))
        }
        rightViewMode = .always
        
        return self
    }
    
    ///添加事件
    @discardableResult public
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event = .editingChanged) -> Self{
        addTarget(target, action: action, for: controlEvents)
        return self
    }
    
}
