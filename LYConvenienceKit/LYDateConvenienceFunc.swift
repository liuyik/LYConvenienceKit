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
import Foundation

public struct LYDateConvenienceFunc {

    private let date: Date
    
    internal init(_ date: Date) {
        self.date = date
    }
    
    ///日期转换成字符串
    func dateToString(format:String="yyyy-MM-dd")->String{
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "zh_CN")
        dateFormatter.dateFormat = format
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    /// 判断当前日期是否为今年
    func isThisYear() -> Bool {
        
        // 获取当前日历
        let calender = Calendar.current
        // 获取日期的年份
        let yearComps = calender.component(.year, from: date)
        // 获取现在的年份
        let nowComps = calender.component(.year, from: Date())
        return yearComps == nowComps
    }
    
    /// 是否是昨天
    func isYesterday() -> Bool {
        
        // 获取当前日历
        let calender = Calendar.current
        // 获取日期的年份
        let comps = calender.dateComponents([.year, .month, .day], from: date, to: Date())
        
        return comps.year == 0 && comps.month == 0 && comps.day == 0
    }
    
    /// 是否是前天
    func isBeforeYesterday() -> Bool {
        
        // 获取当前日历
        let calender = Calendar.current
        // 获取日期的年份
        let comps = calender.dateComponents([.year, .month, .day], from: date, to: Date())
        
        return comps.year == 0 && comps.month == 0 && comps.day == 1
    }
    
    /// 判断是否是今天
    func isToday() -> Bool {
        
        // 日期格式化
        
        let formatter = DateFormatter()
        
        // 设置日期格式
        formatter.dateFormat = "yyyy-MM-dd"
        let dateStr = formatter.string(from: date)
        
        let nowStr = formatter.string(from: Date())
        
        return dateStr == nowStr
    }
}


