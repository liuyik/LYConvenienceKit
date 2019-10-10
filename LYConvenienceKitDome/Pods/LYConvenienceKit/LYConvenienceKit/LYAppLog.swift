//
//  LYUtils.swift
//  LYConvenienceKitDome
//
//  Created by 刘毅 on 2019/10/8.
//  Copyright © 2019 LYConvenienceKit. All rights reserved.
//

import UIKit

///调试模式下打印
public func LYAppLog<T>(_ message: T, fileName: String = #file, methodName: String = #function, lineNumber: Int = #line)
{
    #if DEBUG
    // 要把路径最后的字符串截取出来
    let fName = ((fileName as NSString).pathComponents.last!)
    print("\(fName).\(methodName)[\(lineNumber)]: \(message)")
    #endif
}
