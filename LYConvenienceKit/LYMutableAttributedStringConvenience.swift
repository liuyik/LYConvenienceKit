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
///混合属性
public struct LYMixtureAttribute {
    var string: String = ""
    var color: UIColor = .black
    var font: UIFont = UIFont.systemFont(ofSize: 14)
    var attributes:[NSAttributedString.Key : Any] = [:]
}

extension LYMutableAttributedStringConvenience where Self: NSMutableAttributedString {
    
    ///设置属性文本
    @discardableResult  public
    func mixtureAttributString(_ mixtureAttribute:LYMixtureAttribute) -> Self{
        
        var attribute = mixtureAttribute.attributes
        attribute[NSAttributedString.Key.foregroundColor] = mixtureAttribute.color
        attribute[NSAttributedString.Key.font] = mixtureAttribute.font
        
        let attributedString = NSAttributedString(string: mixtureAttribute.string, attributes: attribute)
        
        self.append(attributedString)
        return self
    }
    
    ///修改行距
    @discardableResult  public
    func changeLineSpace(_ lineSpacing: CGFloat = 8) -> Self {
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        let length = self.length
        
        self.addAttributes([NSAttributedString.Key.paragraphStyle : paragraphStyle], range: NSMakeRange(0, length))
        
        return self
    }
    
    ///添加下滑线
    @discardableResult  public
    func addUnderline(_ lineColor:UIColor = .black,_ lineStyle:NSUnderlineStyle = NSUnderlineStyle.single) -> Self {
        
        //设置下划线...
        /*
         NSUnderlineStyle.none 无下划线
         NSUnderlineStyle.single 单行下划线
         NSUnderlineStyle.thick 粗的下划线
         NSUnderlineStyle.double 双下划线
         */
        //设置下划线
        let length = self.length
        self.addAttribute(.underlineStyle, value: lineStyle.rawValue, range: NSRange(location: 0, length: length))
        
        //设置下划线颜色
        self.addAttributes([NSAttributedString.Key.underlineColor:lineColor], range: NSRange(location: 0, length: length))
        
        return self
    }
    
    ///添加删除线
    @discardableResult  public
    func addStrikethrough(_ strikethroughColor:UIColor = .black) -> Self {
        
        let length = self.length
        
        //设置删除线
        self.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, length))
        
        //设置删除线颜色
        self.addAttribute(NSAttributedString.Key.strikethroughColor, value: strikethroughColor, range: NSMakeRange(0, length))
        
        return self
    }
    
    ///添加图片(默认添加到最后，position添加到具体位置)
    @discardableResult  public
    func addImage(_ image:UIImage,bounds:CGRect,position:Int? = nil) -> Self {
        
        let arkattch = NSTextAttachment() //定义一个attachment
        arkattch.image = image//初始化图片
        arkattch.bounds = bounds //初始化图片的 bounds
        let markattchStr = NSAttributedString(attachment: arkattch) // 将attachment  加入富文本中
        if let i = position{
            self.insert(markattchStr, at: i)
        }else {
            self.append(markattchStr)
        }
        
        return self
    }
    
    
    //MARK: - 字符串中查找给定子串并标记
    ///标记第一个子串
    @discardableResult  public
    func markerStringOf(_ mixtureAttribute:LYMixtureAttribute)-> Self {
        let str = self.string
        
        var attribute = mixtureAttribute.attributes
        attribute[NSAttributedString.Key.foregroundColor] = mixtureAttribute.color
        attribute[NSAttributedString.Key.font] = mixtureAttribute.font
        
        let subString = mixtureAttribute.string
        if let range = str.range(of: subString) {
            self.addAttributes(attribute, range: NSRange(range, in: str))
        }
        
        return self
    }
    
    ///标记所有子串(一般用于搜索时标记所有搜索关键字)
    @discardableResult  public
    func markerAllStringOf(_ mixtureAttribute:LYMixtureAttribute) -> Self{
        let subString = mixtureAttribute.string
        let arr:[NSRange] = ranges(of: subString).map{NSRange($0, in: subString)}
        
        for range in arr {
            var attribute = mixtureAttribute.attributes
            attribute[NSAttributedString.Key.foregroundColor] = mixtureAttribute.color
            attribute[NSAttributedString.Key.font] = mixtureAttribute.font
            self.addAttributes(attribute, range: range )
        }
        
        return self
    }
    
    /*字符串中查找给定子串的所有Range
     *1、初始化时先设置查找范围为整个字符串
     *2、若能通过查找得到子串的Range，进入循环
     *3、保存子串Range到数组
     *4、缩小查找范围，减掉已经查找过的区域
     *5、在缩小的范围内查找子串
     *6、若能在缩小的范围内找到子串，继续下一轮循环
     */
    private func ranges(of string: String) -> [Range<String.Index>] {
        var rangeArray = [Range<String.Index>]()
        var searchedRange: Range<String.Index>
        
        let str = self.string
        guard let sr = str.range(of: str) else {
            return rangeArray
        }
        searchedRange = sr
        
        var resultRange = str.range(of: string, options: .regularExpression, range: searchedRange, locale: nil)
        while let range = resultRange {
            rangeArray.append(range)
            searchedRange = Range(uncheckedBounds: (range.upperBound, searchedRange.upperBound))
            resultRange = str.range(of: string, options: .regularExpression, range: searchedRange, locale: nil)
        }
        return rangeArray
    }
    
    
    ///计算AttributedString的size
    public func ly_calculationAttributedStringSize(attributed: NSAttributedString, size: CGSize,options:NSStringDrawingOptions = .usesLineFragmentOrigin) -> CGSize {
        
        let size = self.boundingRect(with: size, options: options, context: nil).size
        
        return size
        
    }
}
