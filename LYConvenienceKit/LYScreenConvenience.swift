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

public struct LYScreenSize{
    
    ///屏幕宽
    public static var width: CGFloat = UIScreen.main.bounds.width
       
    ///屏幕高
    public static var height: CGFloat = UIScreen.main.bounds.height
    
    
    ///屏幕宽比
    public static var RateWidth:CGFloat = width/375.0
    
    ///屏幕高比
    public static var RateHeight:CGFloat = height/667.0
    
    ///pad屏幕宽比
    public static var PadRateWidth:CGFloat = width/768.0
   
    ///pad屏幕高比
    public static var PadRateHeight:CGFloat = height/1024.0
    
}
