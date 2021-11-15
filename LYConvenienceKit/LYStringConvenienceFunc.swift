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
import CommonCrypto

public struct LYStringConvenienceFunc {

    private let string: String
    
    internal init(_ string: String) {
        self.string = string
    }
    
    //MARK: - String -> NewString
    ///MD5加密
    public func md5String() -> String{
        
        let cStr = string.cString(using: String.Encoding.utf8)
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        
        CC_MD5(cStr!, (CC_LONG)(strlen(cStr!)), buffer)
        
        let md5String = NSMutableString()
        for i in 0 ..< 16{
            md5String.appendFormat("%02x", buffer[i])
        }
        free(buffer)
        
        return md5String as String
    }
    
    ///获取URL中的参数(如：http....com?name=test，name = "name"则返回"test")
    public func getParamByName(_ name:String) -> String {
        
        let regTags = "(^|&|\\?)+\(name)=+([^&]*)(&|$)"
        
        guard let regex = try? NSRegularExpression(pattern: regTags, options: .caseInsensitive) else {
            return ""
        }
        
        let matches = regex.matches(in: string, options: [], range: NSRange(location: 0, length: string.count))
        
        for match in matches {
            let tagValue = (string as NSString).substring(with: match.range(at: 2))
            return tagValue
        }
        return ""
    }
    
    ///HTML富文本反转义
    public func htmlToString() -> String {
        
        var htmlStr = ""
        do {
            htmlStr = try NSAttributedString(data: string.data(using: String.Encoding.utf8, allowLossyConversion: true)!, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html, NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil).string
        }catch {
            print(error)
        }
        
        return htmlStr
    }
      
    /// 日期字符串转date
    /// - Parameter format: 当前字符串格式
    /// - Returns: Date
    public func formatToDate(format:String="yyyy-MM-dd")->Date?{

        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "zh_CN")
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: string)
    }
    
    ///日期字符串，转换成另一种格式的字符串
    /// - Parameter format: 当前字符串格式
    /// - Parameter newFormat: 要转换的日期格式
    /// - Returns: String
    public func formatToNewFormat(_ format:String,newFormat:String="yyyy-MM-dd")->String{

        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "zh_CN")
        dateFormatter.dateFormat = format
        
        if let date = dateFormatter.date(from: string) {
            
            dateFormatter.dateFormat = newFormat
            return dateFormatter.string(from: date)
        }
        return ""
    }
    
    ///计算String的size
    public func calculationStringSize(font: UIFont, size: CGSize,options:NSStringDrawingOptions = .usesLineFragmentOrigin) -> CGSize {
        
        let labelText: NSString = string as NSString
        
        let strSize = labelText.boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font:font], context:nil).size
        
        return strSize
        
    }
    
    //MARK: - String -> NSAttributedString
    public func attributedString() -> NSMutableAttributedString {
        return NSMutableAttributedString(string: string)
    }
    
    ///HTML富文本
    public func htmlToAttributedString() -> NSAttributedString {
        
        let str = string
        
        var htmlStr = NSAttributedString(string: "")
        do {
            if let data = str.data(using: String.Encoding.unicode, allowLossyConversion: true) {
                
                htmlStr = try NSAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
                
            }
            
        }catch {
            print(error)
        }
        
        return htmlStr
    }
    
    //MARK: - 判断
    ///判断手机号码是否正确
    public func isMobileNumber() -> Bool {
        
        let predicateStr = "^1[0-9]\\d{9}$"
        return evaluatePredicate(predicateStr)
    }
    
    ///判断邮箱是否正确
    public func isEmailNumber() -> Bool {
        
        let predicateStr = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
        return evaluatePredicate(predicateStr)
    }
    
    ///判断密码是否为6-8位字母和数字组合
    public func isPassword() -> Bool {
        
        let predicateStr = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,8}$"
        return evaluatePredicate(predicateStr)
    }
        
    
    ///谓词判断
    public func evaluatePredicate(_ str:String) -> Bool {
        let predicate = NSPredicate.init(format: "SELF MATCHES %@", str)
        return predicate.evaluate(with: string)
    }
    
    ///app是否能够打开链接，能就打开链接
    public func isAppCanOpen() -> Bool {
        if let url = URL(string: string) {
            
            if UIApplication.shared.canOpenURL(url) {
                
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                return true
            }
        }
        return false
    }
}

