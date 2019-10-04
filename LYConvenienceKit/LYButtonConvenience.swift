//
//  LYConvenienceKit
//
//  Copyright (c) 2011-Present LYConvenienceKit Team - https://github.com/liuyik/LYConvenienceKit.git
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

extension LYViewConvenience where Self: UIButton {
   
    ///设置标题
    @discardableResult
    func title(_ title:String?,_ state:UIControl.State = .normal) -> Self{
        setTitle(title, for: state)
        return self
    }
    
    ///设置标题颜色
    @discardableResult
    func titleColor(_ color:UIColor,_ state:UIControl.State = .normal) -> Self {
        setTitleColor(color, for: state)
        return self
    }
    
    ///设置字体
    @discardableResult
    func font(_ font:CGFloat) -> Self{
        titleLabel?.font = UIFont.systemFont(ofSize: font)
        return self
    }
    
    ///设置粗字体
    @discardableResult
    func boldFont(_ font:CGFloat) -> Self{
        titleLabel?.font = UIFont.boldSystemFont(ofSize: font)
        return self
    }
    
    ///设置图片
    @discardableResult
    func image(_ image:UIImage?,_ state:UIControl.State = .normal) -> Self {
        setImage(image, for: state)
        return self
    }
    
    ///设置背景图片
    @discardableResult
    func backgroundImage(_ image:UIImage?,_ state:UIControl.State = .normal) -> Self {
        setBackgroundImage(image, for: state)
        return self
    }
    
    ///添加点击事件
    @discardableResult
    func addClickTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event = .touchUpInside) -> Self{
        addTarget(target, action: action, for: controlEvents)
        return self
    }
    
    /// 修改按钮图片的位置
    /// - parameter position: .top:图片在上 .left:图片在左 .bottom:图片在下 .right:图片在右
    /// - parameter spacing: 图片与文字的间隙
    func changeImagePosition(_ position: UIView.ContentMode, _ spacing: CGFloat = 5) -> Self{
        
        let imageSize = self.imageRect(forContentRect:self.frame)
        let titleFont = self.titleLabel?.font!
        let title = self.titleLabel?.text ?? ""
        let titleSize = title.size(withAttributes:[NSAttributedString.Key.font: titleFont!])
        
        let imgSizeWidth = imageSize.width
        let imgSizeHeight = imageSize.height
        
        var titSizeWidth = titleSize.width
        if position == .left || position == .right {
            
            if titSizeWidth + imgSizeWidth >= self.frame.size.width {
                titSizeWidth = self.frame.size.width - imgSizeWidth - spacing
            }
        }
        let titSizeHeight = titleSize.height
        
        var titleInsets: UIEdgeInsets
        var imageInsets: UIEdgeInsets
        
        switch (position){
        case .top:
            titleInsets = UIEdgeInsets(top: 0,left: -(imgSizeWidth), bottom: -imgSizeHeight-spacing/2, right: 0)
            imageInsets = UIEdgeInsets(top: -titSizeHeight-spacing/2, left: 0, bottom: 0, right: -titSizeWidth)
            
        case .bottom:
            titleInsets = UIEdgeInsets(top: -imgSizeHeight-spacing/2,left: -imgSizeWidth, bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -titSizeHeight-spacing/2, right: -titSizeWidth)
            
        case .left:
            titleInsets = UIEdgeInsets(top: 0,left: spacing/2, bottom: 0, right: -spacing/2)
            imageInsets = UIEdgeInsets(top: 0, left: -spacing/2, bottom: 0, right: spacing/2)
            
        case .right:
            titleInsets = UIEdgeInsets(top: 0, left: -imgSizeWidth-spacing/2, bottom: 0, right: imgSizeWidth+spacing/2)
            imageInsets = UIEdgeInsets(top: 0, left: titSizeWidth+spacing/2, bottom: 0, right: -titSizeWidth-spacing/2)
            
        default:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        self.titleEdgeInsets = titleInsets
        self.imageEdgeInsets = imageInsets
        
        return self
    }
    
    ///添加下划线，top:离文字底部的距离
    func addUnderline(_ top:CGFloat = 0,_ height:CGFloat = 1) -> Self{
        
        guard let titLabel = titleLabel else {return self}
        
        UIView()
            .backgroundColor(titLabel.textColor)
            .layout(self) { (make) in
                make.top.equalTo(titLabel.snp.bottom).offset(top)
                make.width.left.equalTo(titLabel)
                make.height.equalTo(height)
        }
        
        return self
    }
    
    ///验证码倒计时
    func ly_countDown(_ count: Int,_ title:String = "发送验证码"){
        // 倒计时开始,禁止点击事件
        isEnabled = false
        
        // 保存当前的背景颜色
        let defaultColor = self.backgroundColor
        // 设置倒计时,按钮背景颜色
        backgroundColor = UIColor.gray
        
        var remainingCount: Int = count {
            willSet {
                setTitle("\(newValue)s", for: .normal)
                
                if newValue <= 0 {
                    setTitle(title, for: .normal)
                }
            }
        }
        
        // 在global线程里创建一个时间源
        let codeTimer = DispatchSource.makeTimerSource(queue:DispatchQueue.global())
        // 设定这个时间源是每秒循环一次，立即开始
        codeTimer.schedule(deadline: .now(), repeating: .seconds(1))
        // 设定时间源的触发事件
        codeTimer.setEventHandler(handler: {
            
            // 返回主线程处理一些事件，更新UI等等
            DispatchQueue.main.async {
                // 每秒计时一次
                remainingCount -= 1
                // 时间到了取消时间源
                if remainingCount <= 0 {
                    self.backgroundColor = defaultColor
                    self.isEnabled = true
                    codeTimer.cancel()
                }
            }
        })
        // 启动时间源
        codeTimer.resume()
    }
}
