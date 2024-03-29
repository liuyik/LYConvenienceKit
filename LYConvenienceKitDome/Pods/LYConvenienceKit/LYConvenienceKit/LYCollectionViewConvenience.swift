//
//  LYCollectionViewConvenience.swift
//  LYConvenienceKitDome
//
//  Created by 刘毅 on 2019/10/2.
//  Copyright © 2019 LYConvenienceKit. All rights reserved.
//

import UIKit

extension LYCollectionViewFlowLayoutConvenience where Self: UICollectionViewFlowLayout {
    
    ///最小行间隙
    @discardableResult public
    func minimumLineSpacing(_ spacing:CGFloat = 0) -> Self {
        minimumLineSpacing = spacing
        return self
    }
    
    ///最小列间隙
    @discardableResult public
    func minimumInteritemSpacing(_ spacing:CGFloat = 0) -> Self {
        minimumInteritemSpacing = spacing
        return self
    }
    
    ///itemSize
    @discardableResult public
    func itemSize(_ size:CGSize) -> Self {
        itemSize = size
        return self
    }
    
    ///估算itemSize
    @discardableResult public
    func estimatedItemSize(_ size:CGSize) -> Self {
        estimatedItemSize = size
        return self
    }
    
    ///滑动方向
    @discardableResult public
    func scrollDirection(_ direction:UICollectionView.ScrollDirection = .vertical) -> Self {
        scrollDirection = direction
        return self
    }

    ///headerSize
    @discardableResult public
    func headerReferenceSize(_ size:CGSize) -> Self {
        headerReferenceSize = size
        return self
    }
    
    ///footerSize
    @discardableResult public
    func footerReferenceSize(_ size:CGSize) -> Self {
        footerReferenceSize = size
        return self
    }

    ///sectionInset
    @discardableResult public
    func sectionInset(_ inset:UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)) -> Self {
        sectionInset = inset
        return self
    }

    ///sectionHeaders是否悬浮
    @available(iOS 9.0, *)
    @discardableResult public
    func sectionHeadersPinToVisibleBounds(_ isVisible:Bool = true) -> Self{
        sectionHeadersPinToVisibleBounds = isVisible
        return self
    }
    
    ///sectionFooters是否悬浮
    @available(iOS 9.0, *)
    @discardableResult public
    func sectionFootersPinToVisibleBounds(_ isVisible:Bool = true) -> Self{
        sectionFootersPinToVisibleBounds = isVisible
        return self
    }
}

extension LYViewConvenience where Self: UICollectionView {
    
    ///delegate
    @discardableResult public
    func delegate(_ target: Any?) -> Self{
        delegate = target as? UICollectionViewDelegate
        return self
    }
    
    ///dataSource
    @discardableResult public
    func dataSource(_ target: Any?) -> Self{
        dataSource = target as? UICollectionViewDataSource
        return self
    }
    
    // MARK: - cell register and reuse
    ///注册xibCell
    @discardableResult public
    func registerCellNib<T: UICollectionViewCell>(_ aClass: T.Type) -> Self{
        let name = String(describing: aClass)
        let nib = UINib(nibName: name, bundle: nil)
        register(nib, forCellWithReuseIdentifier: name)
        return self
    }
       
    ///注册Cell
    @discardableResult public
    func registerCellClass<T: UICollectionViewCell>(_ aClass: T.Type) -> Self{
        let name = String(describing: aClass)
        register(aClass, forCellWithReuseIdentifier: name)
        return self
    }
    
    ///重用的cell
    @discardableResult public
    func ly_dequeueReusableCell<T: UICollectionViewCell>(_ aClass: T.Type,_ indexPath: IndexPath) -> T {
        let name = String(describing: aClass)
    
        let cell = dequeueReusableCell(withReuseIdentifier: name, for: indexPath)
        return cell as! T
    }
    
    // MARK: - HeaderFooter register and reuse
    ///注册xibHeaderFooter
    @discardableResult public
    func registerHeaderFooterNib<T: UIView>(_ aClass: T.Type,_ isHeader:Bool = true) -> Self{
        let name = String(describing: aClass)
        let nib = UINib(nibName: name, bundle: nil)
        let kind = isHeader ? UICollectionView.elementKindSectionHeader:UICollectionView.elementKindSectionFooter
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: name)
        return self
    }
       
    ///注册HeaderFooter
    @discardableResult public
    func registerHeaderFooterClass<T: UICollectionReusableView>(_ aClass: T.Type,_ isHeader:Bool = true) -> Self{
        let name = String(describing: aClass)
        let kind = isHeader ? UICollectionView.elementKindSectionHeader:UICollectionView.elementKindSectionFooter
        register(aClass, forSupplementaryViewOfKind: kind, withReuseIdentifier: name)
        return self
    }
    
    ///重用HeaderFooter
    @discardableResult public
    func ly_dequeueReusableHeaderFooter<T: UICollectionReusableView>(_ aClass: T.Type,_ kind:String,_ indexPath: IndexPath) -> T {
        let name = String(describing: aClass)
        let cell = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: name, for: indexPath)
        return cell as! T
    }
    
}
