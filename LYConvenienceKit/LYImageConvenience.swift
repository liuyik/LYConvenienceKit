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

extension LYImageConvenience where Self: UIImage {
    
    ///图片设置圆角
    func ly_cornerImage(_ cornerRadii: CGSize,byRoundingCorners: UIRectCorner = UIRectCorner.allCorners) -> UIImage? {
        
        let imageRect = CGRect(origin: CGPoint.zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer {
            UIGraphicsEndImageContext()
        }
        let context = UIGraphicsGetCurrentContext()
        guard context != nil else {
            return nil
        }
        context?.setShouldAntialias(true)
        let bezierPath = UIBezierPath(roundedRect: imageRect,
                                      byRoundingCorners: byRoundingCorners,
                                      cornerRadii: cornerRadii)
        bezierPath.close()
        bezierPath.addClip()
        self.draw(in: imageRect)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    
    /**
     *  压缩上传图片到指定kb
     *  maxLength 压缩后最大多少kb
     *  return 压缩后图片的二进制
     */
    func ly_compressImage(_ maxLength: Int = 100) -> Data? {
       
        var compress:CGFloat = 0.9
        
        var data = self.jpegData(compressionQuality: compress)
        while data?.count ?? 0 > maxLength*1024 && compress > 0.01 {
            compress -= 0.02
            data = self.jpegData(compressionQuality: compress)
        }
        
        return data
    }
    
    /**
    *  压缩上传图片到指定size
    *  changedSize 压缩后size
    *  注：size中width或height为0时，会按图片比例计算长高
    *  return 压缩后图片的二进制
    */
    func ly_resizeImage(changedSize: CGSize = CGSize(width: 375, height: 0)) -> UIImage{
        
        //prepare constants
        let width = self.size.width
        let height = self.size.height
        let scale = width/height
        
        var sizeChange = CGSize()
        
        var changedWidth:CGFloat = changedSize.width
        var changedheight:CGFloat = changedSize.height
        
        if changedWidth == 0 && changedheight == 0{
            return self
        }else if changedWidth > 0 && changedheight > 0 {
            if width <= changedWidth && height <= changedheight{
                return self
            }else {
                sizeChange = changedSize
            }
        }else if changedWidth > 0 && changedheight == 0 {
            if width < changedWidth {
                return self
            }else {
                changedheight = changedWidth / scale
                sizeChange = CGSize(width: changedWidth, height:changedheight)
            }
        }else if changedWidth == 0 && changedheight > 0 {
            if height < changedheight {
                return self
            }else {
                changedWidth = changedheight * scale
                sizeChange = CGSize(width: changedWidth, height:changedheight)
            }
        }
        
        UIGraphicsBeginImageContext(sizeChange)
        
        //draw resized image on Context
        self.draw(in: CGRect(x: 0, y: 0, width: sizeChange.width, height: sizeChange.height))
        
        //create UIImage
        let resizedImg = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return resizedImg!
    }
    
    ///图片转颜色
    func ly_color() -> UIColor {
        
        return UIColor(patternImage: self)
    }
}
