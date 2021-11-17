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
    /// - Parameter cornerRadii:圆角大小
    /// - Parameter corners:任意角的圆角
    public func ly_cornerImage(_ cornerRadii: CGSize,byRounding corners: UIRectCorner = UIRectCorner.allCorners) -> UIImage? {
        
        let imageRect = CGRect(origin: CGPoint.zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer {
            UIGraphicsEndImageContext()
        }
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        context.setShouldAntialias(true)
        let bezierPath = UIBezierPath(roundedRect: imageRect,
                                      byRoundingCorners: corners,
                                      cornerRadii: cornerRadii)
        bezierPath.close()
        bezierPath.addClip()
        self.draw(in: imageRect)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    
    ///压缩上传图片到指定kb
    /// - Parameter maxLength: 压缩后最大多少kb
    public func ly_compressImage(_ maxLength: Int = 100) -> Data? {
       
        var compress:CGFloat = 0.9
        
        var data = self.jpegData(compressionQuality: compress)
        if data?.count ?? 0 < maxLength {
            return data
        }
        while data?.count ?? 0 > maxLength*1024 && compress > 0.01 {
            compress -= 0.02
            data = self.jpegData(compressionQuality: compress)
        }
        
        return data
    }
    
    ///压缩上传图片到指定size
    /// - Parameter changedSize: 压缩后size
    ///注：size中width或height为0时，会按图片比例计算长高
    public func ly_resizeImage(changedSize: CGSize = CGSize(width: 375, height: 0)) -> UIImage{
        
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
    public func ly_color() -> UIColor {
        
        return UIColor(patternImage: self)
    }
    
    ///给图片加图片水印
    /// - Parameter image: 图片水印
    /// - Parameter imageFrame: 图片水印Frame
    public func ly_composeImageWithWatermark(_ image: UIImage,
                               imageFrame: CGRect) -> UIImage? {
        //以Image的图大小为底图
        guard let imageRef = self.cgImage  else {
            return nil
        }
        let w: CGFloat = CGFloat(imageRef.width)
        let h: CGFloat = CGFloat(imageRef.height)
        //以1.png的图大小为画布创建上下文
        UIGraphicsBeginImageContext(CGSize(width: w, height: h))
        self.draw(in: CGRect(x: 0, y: 0, width: w, height: h))
        //先把image 画到上下文中
        let scale = self.scale
        let x = imageFrame.origin.x * scale
        let y = imageFrame.origin.y * scale
        let width = imageFrame.size.width * scale
        let height = imageFrame.size.height * scale
        image.draw(in: CGRect(x: x, y: y, width: width, height: height))
    
        //再把小图放在上下文中
        let resultImg: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        
        //从当前上下文中获得最终图片
        UIGraphicsEndImageContext()
        return resultImg
    }
    
    /// 截取图片的指定区域，并生成新图片
    /// - Parameter rect: 指定的区域
    public func ly_cropping(to rect: CGRect) -> UIImage? {
        let scale = self.scale
        let x = rect.origin.x * scale
        let y = rect.origin.y * scale
        let width = rect.size.width * scale
        let height = rect.size.height * scale
        let croppingRect = CGRect(x: x, y: y, width: width, height: height)
        
        // 截取部分图片并生成新图片
        guard let sourceImageRef = self.cgImage else { return nil }
        guard let newImageRef = sourceImageRef.cropping(to: croppingRect) else { return nil }
        
        let newImage =  UIImage(cgImage: newImageRef, scale: scale, orientation: self.imageOrientation)
        return newImage
    }
}
