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
import Kingfisher

extension LYViewConvenience where Self: UIImageView {
    
    ///设置图片
    @discardableResult public
    func image(_ img:UIImage?) -> Self {
        image = img
        return self
    }
    
    ///设置图片数组(gif)
    @discardableResult public
    func images(_ imgs:[UIImage],
                duration:TimeInterval = 1.0,
                repeatCount:Int = 0) -> Self {
        //设置动画数组图片
        animationImages = imgs
        //设置一个动画的时长
        animationDuration = duration
        //设置动画循环的次数（0是无线循环）
        animationRepeatCount = repeatCount
        //开始动画
        startAnimating()
        return self
    }
    
    //MARK:UIImageView用Kingfisher加载网络图片
    ///设置网络图片
    public func ly_setKfImage(_ imageUrl:String?,
                       _ placeholderImageName:String = "ly_placeholder") {
        
        var imageURL : URL?
        var placeholderImage : UIImage?
        
        if let url = imageUrl,let imgUrl = URL(string: url) {
           imageURL = imgUrl
        }
        if placeholderImageName == "ly_placeholder" {
            placeholderImage = Bundle.ly_bundleWithName("LYConvenienceKit")?.ly_pngImage(placeholderImageName)
        }else {
            placeholderImage = UIImage(named: placeholderImageName)
        }
        
        if let URL = imageURL {
            self.kf.setImage(with: ImageResource(downloadURL: URL), placeholder: placeholderImage)
        }else {
            self.image = placeholderImage
        }
       
    }
    
    ///设置网络图片(无默认图片,需自己设置UIImage)
    public func ly_setKfImage(_ imageUrl:String?,
                        placeholder image:UIImage?) {
        
        if let url = imageUrl,let imgUrl = URL(string: url) {
            self.kf.setImage(with: ImageResource(downloadURL: imgUrl), placeholder: image)
          
        }else {
            self.image = image
        }
       
    }
    
}
