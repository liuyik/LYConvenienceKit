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
    @discardableResult
    func delegate(target: Any?) -> Self{
        delegate = target as? UIScrollViewDelegate
        return self
    }
    
    ///滑动到顶部或底部是否有弹性效果
    @discardableResult
    func bounces(_ isBounce:Bool = false) -> Self{
        bounces = isBounce
        return self
    }
    
    ///是否可以滑动
    @discardableResult
    func scrollEnabled(_ isScroll:Bool = false) -> Self{
        isScrollEnabled = isScroll
        return self
    }
    
    ///是否分页滑动
    @discardableResult
    func pagingEnabled(_ isPage:Bool = true) -> Self{
        isPagingEnabled = isPage
        return self
    }
    
    ///是否展示水平滚动条
    @discardableResult
    func showsHorizontalScrollIndicator(_ isShow:Bool = false) -> Self{
        showsHorizontalScrollIndicator = isShow
        return self
    }
    
    ///是否展示垂直滚动条
    @discardableResult
    func showsVerticalScrollIndicator(_ isShow:Bool = false) -> Self{
        showsVerticalScrollIndicator = isShow
        return self
    }
}
