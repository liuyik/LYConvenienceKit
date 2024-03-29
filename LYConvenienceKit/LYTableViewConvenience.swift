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

extension LYViewConvenience where Self: UITableView {
    
    // MARK: - 常用的属性
    ///设置cell的高度
    @discardableResult public
    func rowHeight(_ height:CGFloat = UITableView.automaticDimension) -> Self{
        rowHeight = height
        return self
    }
    
    ///估算cell的高度
    @discardableResult public
    func estimatedRowHeight(_ rowHeight:CGFloat = 44.0) -> Self{
        estimatedRowHeight = rowHeight
        return self
    }
    
    ///分割线样式
    @discardableResult public
    func separatorStyle(_ style:UITableViewCell.SeparatorStyle = .none) -> Self{
        separatorStyle = style
        return self
    }
    
    ///头视图
    @discardableResult public
    func tableHeaderView(_ headView:UIView) -> Self{
        tableHeaderView = headView
        return self
    }
    
    ///尾视图
    @discardableResult public
    func tableFooterView(_ footView:UIView) -> Self{
        tableFooterView = footView
        return self
    }
    
    ///delegate
    @discardableResult public
    func delegate(_ target: Any?) -> Self{
        delegate = target as? UITableViewDelegate
        return self
    }
    
    ///dataSource
    @discardableResult public
    func dataSource(_ target: Any?) -> Self{
        dataSource = target as? UITableViewDataSource
        return self
    }
    
    // MARK: - cell register and reuse
    ///注册xibCell
    @discardableResult public
    func registerCellNib<T: UITableViewCell>(_ aClass: T.Type) -> Self{
        let name = String(describing: aClass)
        let nib = UINib(nibName: name, bundle: nil)
        self.register(nib, forCellReuseIdentifier: name)
        return self
    }
       
    ///注册Cell
    @discardableResult public
    func registerCellClass<T: UITableViewCell>(_ aClass: T.Type) -> Self{
        let name = String(describing: aClass)
        register(aClass, forCellReuseIdentifier: name)
        return self
    }
    
    ///重用的cell
    @discardableResult public
    func ly_dequeueReusableCell<T: UITableViewCell>(_ aClass: T.Type,_ indexPath: IndexPath) -> T {
        let name = String(describing: aClass)
        
        let cell = dequeueReusableCell(withIdentifier: name,for: indexPath)
        return cell as! T
    }
    
    // MARK: - HeaderFooter register and reuse
    ///注册xibHeaderFooter
    @discardableResult public
    func registerHeaderFooterNib<T: UITableViewHeaderFooterView>(_ aClass: T.Type) -> Self{
        let name = String(describing: aClass)
        let nib = UINib(nibName: name, bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: name)
        return self
    }
       
    ///注册HeaderFooter
    @discardableResult public
    func registerHeaderFooterClass<T: UITableViewHeaderFooterView>(_ aClass: T.Type) -> Self{
        let name = String(describing: aClass)
        register(aClass, forHeaderFooterViewReuseIdentifier: name)
        return self
    }
    
    ///重用HeaderFooter
    @discardableResult public
    func ly_dequeueReusableHeaderFooter<T: UIView>(_ aClass: T.Type) -> T? {
        let name = String(describing: aClass)
        let cell = dequeueReusableHeaderFooterView(withIdentifier: name)
        return cell as? T 
    }
    
}
