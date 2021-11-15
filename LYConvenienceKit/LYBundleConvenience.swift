//
//  LYBundleConvenience.swift
//  LYConvenienceKit
//
//  Created by liuyi on 2021/11/11.
//

import Foundation

extension LYBundleConvenience where Self: Bundle {
    
    /**
     获取bundle文件
     
     - Parameter bundle: .bundle文件名
     - Parameter pod: podName:Pods下的文件名，默认情况下pod和bundle相同，传一个即可
     - Returns: Bundle
     */
    @discardableResult public static
    func ly_bundleWithName(_ bundle:String,pod:String?=nil) -> Bundle? {
        let bundleName = bundle
        var podName = bundleName
        if let podname = pod {
            podName = podname
        }
        //Podfile没使用use_frameworks!的情况下
        if let bundleUrl = Bundle.main.path(forResource: bundleName, ofType: "bundle") {
            
            let url = URL(fileURLWithPath: bundleUrl)
            return Bundle(url: url)
        }
        
        //Podfile使用use_frameworks!的情况下
        guard var frameworksUrl = Bundle.main.path(forResource: "Frameworks", ofType: nil) else {
            return nil
        }
        frameworksUrl = frameworksUrl.appending("/\(podName).framework")
        
        let url = URL(fileURLWithPath: frameworksUrl)
        
        guard let bundleURL = Bundle(url: url)?.url(forResource: bundleName, withExtension: "bundle") else {
            return nil
        }
        return Bundle(url: bundleURL)
    }
    
    ///获取PNG图片，name文件名，注意文件名后面的@2x也要
    @discardableResult public
    func ly_pngImage(_ name:String) -> UIImage?{
        guard let path = self.path(forResource: name, ofType: "png") else {return nil}
        return UIImage(contentsOfFile: path)
    }
    
    ///获取JPG图片，name文件名，注意文件名后面的@2x也要
    @discardableResult public
    func ly_jpgImage(_ name:String) -> UIImage?{
        guard let path = self.path(forResource: name, ofType: "jpg") else {return nil}
        return UIImage(contentsOfFile: path)
    }
    
    ///获取json文件数据
    @discardableResult public
    func ly_jsonObject(_ name:String) -> Any? {
        guard let path = self.path(forResource: name, ofType: "json") else {return nil}
        guard let jsonData = try? Data(contentsOf: URL(fileURLWithPath:path)) else {return nil}
        return try? JSONSerialization.jsonObject(with: jsonData, options: .fragmentsAllowed)
    }
    
    ///获取plist文件Dictionary数据
    @discardableResult public
    func ly_plistDictionary(_ name:String) -> [String:Any]? {
        guard let path = self.path(forResource: name, ofType: "plist") else {return nil}
        return NSDictionary(contentsOfFile: path) as? [String : Any]
    }
    
    ///获取plist文件Aarry数据
    @discardableResult public
    func ly_plistAarry(_ name:String) -> Array<Any>? {
        guard let path = self.path(forResource: name, ofType: "plist") else {return nil}
        return NSArray(contentsOfFile: path) as? Array<Any>
    }
}
