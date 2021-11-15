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
    public func dateToString(format:String="yyyy-MM-dd")->String{
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "zh_CN")
        dateFormatter.dateFormat = format
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    /// 年
    public var year: Int {
        return Calendar.current.component(Calendar.Component.year, from: date)
    }
    
    /// 月
    public var month: Int {
        return Calendar.current.component(Calendar.Component.month, from: date)
    }
    
    /// 日
    public var day: Int {
        return Calendar.current.component(.day, from: date)
    }
    
    /// 小时
    public var hour: Int {
        return Calendar.current.component(.hour, from: date)
    }
    
    /// 分钟
    public var minute: Int {
        return Calendar.current.component(.minute, from: date)
    }
    
    /// 秒
    public var second: Int {
        return Calendar.current.component(.second, from: date)
    }
    
    /// 一周的第几天，通常从周日开始为1，即周三为4。
    public var weekday: Int {
        return Calendar.current.component(.weekday, from: date)
    }

    /// 昨天
    public var yesterDay: Date? {
        return adding(day: -1)
    }

    /// 明天
    public var tomorrowDay: Date? {
        return adding(day: 1)
    }

    /// 前天
    public var theDayBeforYesterDay: Date? {
        return adding(day: -2)
    }

    /// 后天
    public var theDayAfterTomorrowDay: Date? {
        return adding(day: 2)
    }
    
    /// 是否为今年
    public func isThisYear() -> Bool {
        
        // 获取当前日历
        let calender = Calendar.current
        // 获取日期的年份
        let yearComps = calender.component(.year, from: date)
        // 获取现在的年份
        let nowComps = calender.component(.year, from: Date())
        return yearComps == nowComps
    }
    
    /// 是否是昨天
    public func isYesterDay() -> Bool {
        
        //先拿到昨天的 date
        guard let yesterDayDate = Date().ly.yesterDay else {
            return false
        }
        //比较当前的日期和昨天的日期
        if date.ly.dateToString() == yesterDayDate.ly.dateToString() {
            return true
        }
        return false
    }
    
    /// 是否是明天
    public func isTomorrowDay() -> Bool {
        
        //先拿到明天的 date
        guard let tomorrowDayDate = Date().ly.tomorrowDay else {
            return false
        }
        //比较当前的日期和明天的日期
        if date.ly.dateToString() == tomorrowDayDate.ly.dateToString() {
            return true
        }
        return false
    }
    
    /// 是否是前天
    public func isBeforeYesterDay() -> Bool {
        
        //先拿到前天的 date
        guard let theDayBeforYesterDayDate = Date().ly.theDayBeforYesterDay else {
            return false
        }
        //比较当前的日期和前天的日期
        if date.ly.dateToString() == theDayBeforYesterDayDate.ly.dateToString() {
            return true
        }
        return false
    }
    
    /// 是否是后天
    public func isAfterTomorrowDay() -> Bool {
        
        //先拿到后天的 date
        guard let afterTomorrowDayDate = Date().ly.theDayAfterTomorrowDay else {
            return false
        }
        //比较当前的日期和后天的日期
        if date.ly.dateToString() == afterTomorrowDayDate.ly.dateToString() {
            return true
        }
        return false
    }
    
    /// 判断是否是今天
    public func isToDay() -> Bool {
        if date.ly.dateToString() == Date().ly.dateToString() {
            return true
        }
        return false
    }
    
    /// 日期的加减操作
    /// - Parameter day: 天数变化
    /// - Returns: Date
    private func adding(day: Int) -> Date? {
        return Calendar.current.date(byAdding: DateComponents(day:day), to: date)
    }

}


