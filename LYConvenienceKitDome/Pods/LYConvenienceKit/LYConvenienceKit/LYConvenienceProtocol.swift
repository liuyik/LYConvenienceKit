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

public protocol LYViewConvenience {}

extension UIView:LYViewConvenience{
    public var ly: LYViewConvenienceFunc { return LYViewConvenienceFunc(self) }
}

public protocol LYCollectionViewFlowLayoutConvenience {}

extension UICollectionViewFlowLayout:LYCollectionViewFlowLayoutConvenience{}

public protocol LYMutableAttributedStringConvenience {}

extension NSMutableAttributedString:LYMutableAttributedStringConvenience{}

public protocol LYImageConvenience {}

extension UIImage:LYImageConvenience{}

public protocol LYBundleConvenience {}

extension Bundle:LYBundleConvenience{}

extension String {
    public var ly: LYStringConvenienceFunc { return LYStringConvenienceFunc(self) }
}

extension Double {
    public var ly: LYDoubleConvenienceFunc { return LYDoubleConvenienceFunc(self) }
}

extension Date {
    public var ly: LYDateConvenienceFunc { return LYDateConvenienceFunc(self) }
}

extension Dictionary where Key == String, Value == Any  {
    public var ly: LYDictionaryConvenienceFunc { return LYDictionaryConvenienceFunc(self) }
}
