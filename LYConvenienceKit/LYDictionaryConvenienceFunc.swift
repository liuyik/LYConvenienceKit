//
//  LYDictionaryConvenienceFunc.swift
//  LYConvenienceKitDome
//
//  Created by 刘毅 on 2019/10/8.
//  Copyright © 2019 LYConvenienceKit. All rights reserved.
//

import Foundation

public struct LYDictionaryConvenienceFunc {
    
    private let dictionary: Dictionary<String,Any>
    
    internal init(_ dictionary: Dictionary<String,Any>) {
        self.dictionary = dictionary
    }
    
    /// 判断读取网络数据的时候是不是空值 ,返回Array<Any>
    func getReadArr(_ field:String)->Array<Any>{
        var resultArr:Array<Any>=[]
        if(dictionary[field] is NSNull){
            
        }else{
            if let arr = dictionary[field] as? Array<Any>{
                resultArr = arr
            }
        }
        return resultArr
    }
    
    /// 判断读取网络数据的时候是不是空值 返回[[String:Any]]
    func getReadArrDic(_ field:String)->[[String:Any]]{
        var resultArr:[[String:Any]]=[]
        if(dictionary[field] is NSNull){
            
        }else{
            if let arr = dictionary[field] as? [[String:Any]]{
                resultArr = arr
            }
        }
        return resultArr
    }
    
    /// 判断读取网络数据的时候是不是空值 返回[String:Any]
    func getReadDic(_ field:String)->[String:Any]{
        var resultDic:[String:Any]=[:]
        if(dictionary[field] is NSNull){
            
        }else{
            if let dic = dictionary[field] as? [String:Any]{
                
                resultDic = dic
            }
        }
        return resultDic
    }
    
    ///判断读取的时候是不是空值 返回String
    func getReadString(_ field:String,val:String="",suffix:String="")->String{
        var str:String=val
        if(dictionary[field] is NSNull){
            
        }else{
            if let num = dictionary[field] as? NSNumber {
               str = "\(num)" + suffix
            }else if let string = dictionary[field] as? String {
                str = string + suffix
            }

        }
        return str
    }
    
    ///判断读取的时候是不是空值 返回Int
    func getReadInt(_ field:String,val:Int=0)->Int{
        var rel:Int=val
        if(dictionary[field] is NSNull){
            
        }else{
            if let num = dictionary[field] as? NSNumber {
                rel = Int(truncating: num)
            }else if let str = dictionary[field] as? String {
                if str.count > 0 {
                   rel = Int(str) ?? val
                }
            }
        }
        return rel
    }
    
    ///判断读取的时候是不是空值 返回Float
    func getReadCGFlaot(_ field:String,val:Float=0)->Float{
        var rel:Float=val
        if(dictionary[field] is NSNull){
            
        }else{
            if let num = dictionary[field] as? NSNumber {
                rel = Float(truncating: num)
            }else if let str = dictionary[field] as? String {
                if str.count > 0 {
                    rel = Float(str) ?? val
                }
            }
        }
        return rel
    }
    
    ///判断读取的时候是不是空值 返回Double
    func getReadDouble(_ field:String,val:Double=0)->Double{
        var rel:Double=val
        if(dictionary[field] is NSNull){
            
        }else{
            if let num = dictionary[field] as? NSNumber {
                rel = Double(truncating: num)
            }else if let str = dictionary[field] as? String {
                if str.count > 0 {
                    rel = Double(str) ?? val
                }
            }
        }
        return rel
    }
}
