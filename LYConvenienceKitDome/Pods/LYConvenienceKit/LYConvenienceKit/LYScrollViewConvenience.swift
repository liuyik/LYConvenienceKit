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

extension LYViewConvenience where Self: UIScrollView {
    
    ///delegate
    @discardableResult public
    func delegate(_ target: Any?) -> Self{
        delegate = target as? UIScrollViewDelegate
        return self
    }
    
    ///滑动到顶部或底部是否有弹性效果
    @discardableResult public
    func bounces(_ isBounce:Bool = false) -> Self{
        bounces = isBounce
        return self
    }
    
    ///是否可以滑动
    @discardableResult public
    func scrollEnabled(_ isScroll:Bool = false) -> Self{
        isScrollEnabled = isScroll
        return self
    }
    
    ///是否分页滑动
    @discardableResult public
    func pagingEnabled(_ isPage:Bool = true) -> Self{
        isPagingEnabled = isPage
        return self
    }
    
    ///是否展示水平滚动条
    @discardableResult public
    func showsHorizontalScrollIndicator(_ isShow:Bool = false) -> Self{
        showsHorizontalScrollIndicator = isShow
        return self
    }
    
    ///是否展示垂直滚动条
    @discardableResult public
    func showsVerticalScrollIndicator(_ isShow:Bool = false) -> Self{
        showsVerticalScrollIndicator = isShow
        return self
    }
    
    ///截全图
    public func ly_screenShot (_ completionHandler: @escaping (_ screenShotImage: UIImage?) -> ()) {
        
        guard let snapShotView = self.snapshotView(afterScreenUpdates: true) else {
            return completionHandler(nil)
        }
        
        snapShotView.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: snapShotView.frame.size.width, height: snapShotView.frame.size.height)
        self.superview?.addSubview(snapShotView)
        
        let bakOffset    = self.contentOffset
        
        let page  = floorf(Float(self.contentSize.height / self.bounds.height))
        
        UIGraphicsBeginImageContextWithOptions(self.contentSize, false, UIScreen.main.scale)
        
        self.contentScrollPageDraw(0, maxIndex: Int(page), drawCallback: { [weak self] () -> Void in
          
            let screenShotImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            self?.setContentOffset(bakOffset, animated: false)
            snapShotView.removeFromSuperview()
            
            completionHandler(screenShotImage)
        })
        
    }
    
    //计算偏移量，每一页绘制一次
    fileprivate func contentScrollPageDraw (_ index: Int, maxIndex: Int, drawCallback: @escaping () -> ()) {
        
        self.setContentOffset(CGPoint(x: 0, y: CGFloat(index) * self.frame.size.height), animated: false)
        let splitFrame = CGRect(x: 0, y: CGFloat(index) * self.frame.size.height, width: bounds.size.width, height: bounds.size.height)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(0.3 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) { () -> Void in
            self.drawHierarchy(in: splitFrame, afterScreenUpdates: true)
            
            if index < maxIndex {
                self.contentScrollPageDraw(index + 1, maxIndex: maxIndex, drawCallback: drawCallback)
            }else{
                drawCallback()
            }
        }
    }
}
