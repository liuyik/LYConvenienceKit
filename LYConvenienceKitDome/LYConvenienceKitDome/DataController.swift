//
//  DataController.swift
//  LYConvenienceKitDome
//
//  Created by liuyi on 2021/11/12.
//  Copyright © 2021 LYConvenienceKit. All rights reserved.
//

import UIKit

class DataController: UIViewController {

    var dataType: DataType = .string
    
    lazy var scrollView = UIScrollView()
        .backgroundColor(.white)
        .layout(view) { make in
            make.edges.equalToSuperview()
        }
    
    lazy var label = UILabel()
        .numberOfLines(0)
        .layout(scrollView) { make in
            make.width.equalTo(LYScreenSize.width - 20)
            make.centerX.equalToSuperview()
            make.edges.equalTo(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor(.white)
        
        switch dataType {
        case .string : string()
            
        case .attributedString: attributedString()
            
        case .date : date()
        
        case .image : image()
        }
    }
    

}

//MARK: - string
extension DataController {
    
    func string() {
        
        let md5Str = "123456".ly.md5String()
        
        let netStr = "https://www.baidu.com/s?ie=utf-8&f=8&rsv_bp=1"
        let ie = netStr.ly.getParamByName("ie")
        let rsv_bp = netStr.ly.getParamByName("rsv_bp")
        
        let time = "2021年11月12日".ly.formatToNewFormat("yyyy年MM月dd日", newFormat: "MM,dd--yyyy")
        
        let str = "123456md5加密\(md5Str)\n\n获取网页\(netStr)的参数ie=(\(ie)),rsv_bp=(\(rsv_bp))\n\n日期格式转换2021年11月12日转换成\(time)"
        label.text = str
    }
}

//MARK: - attributedString
extension DataController {
    
    func attributedString() {
        let str = "123456".ly.md5String()
        LYAppLog(str)
        let astr:NSMutableAttributedString = str.ly.attributedString()
        astr.mixtureAttributString(LYMixtureAttribute(string: "红色", color: .red, font: UIFont.systemFont(ofSize: 20)))
            .mixtureAttributString(LYMixtureAttribute(string: "蓝色4", color: .blue, font: UIFont.systemFont(ofSize: 25)))
            .addUnderline(.yellow)
            .addStrikethrough(.yellow)
            .addImage(#imageLiteral(resourceName: "YELLOW2d"), bounds: CGRect(x: 0, y: 0, width:40, height: 40))
            .changeLineSpace(50)
            .markerStringOf(LYMixtureAttribute(string: "b", color: .yellow, font: UIFont.systemFont(ofSize: 30)))
            .markerAllStringOf(LYMixtureAttribute(string: "4", color: .orange, font: UIFont.systemFont(ofSize: 30)))
        
        label.attributedText(astr)
    }
}

//MARK: - Date
extension DataController {
    
    func date() {
        let date = Date()
        
        let yesterDay = date.ly.yesterDay?.ly.dateToString(format:"yyyy年MM月dd日HH时mm分ss秒") ?? ""
        let tomorrowDay = date.ly.tomorrowDay?.ly.dateToString(format:"yyyy年MM月dd日HH时mm分ss秒") ?? ""
        let theDayBeforYesterDay = date.ly.theDayBeforYesterDay?.ly.dateToString(format:"yyyy年MM月dd日HH时mm分ss秒") ?? ""
        let theDayAfterTomorrowDay = date.ly.theDayAfterTomorrowDay?.ly.dateToString(format:"yyyy年MM月dd日HH时mm分ss秒") ?? ""
        
        
        let theDay = "2021年11月12日".ly.formatToDate(format: "yyyy年MM月dd日")
        
        let isThisYear = theDay?.ly.isThisYear() ?? false
        let isYesterDay = theDay?.ly.isYesterDay() ?? false
        let isBeforeYesterDay = theDay?.ly.isBeforeYesterDay() ?? false
        let isToDay = theDay?.ly.isToDay() ?? false
        let isTomorrowDay = theDay?.ly.isTomorrowDay() ?? false
        let isAfterTomorrowDay = theDay?.ly.isAfterTomorrowDay() ?? false
        
        
        label.text = "今天\(date.ly.year)年\(date.ly.month)月\(date.ly.day)日\(date.ly.hour)时\(date.ly.minute)分\(date.ly.second)秒\n昨天\(yesterDay)\n明天\(tomorrowDay)\n前天\(theDayBeforYesterDay)\n后天\(theDayAfterTomorrowDay)\n\n\n\n判断日期\n\(theDay?.description(with: Locale.current) ?? "")是否是今年\(isThisYear)是否是昨天\(isYesterDay)是否是前天\(isBeforeYesterDay)是否是今天\(isToDay)是否是明天\(isTomorrowDay)是否是后天\(isAfterTomorrowDay)"
    }
}

//MARK: - image
extension DataController {
    
    func image() {
        let img = #imageLiteral(resourceName: "bg001")
        
        let imgView = UIImageView()
            .image(img)
            .layout(scrollView) { (make) in
                make.left.top.equalTo(10)
                make.width.equalTo(LYScreenSize.width-20)
                make.height.equalTo((LYScreenSize.width-20)/2.1)
                make.right.equalTo(-10)
            }
        
        
        let imgView1 = UIImageView()
            .contentMode(.scaleAspectFit)
            .image(img.ly_cornerImage(CGSize(width: img.size.height/2, height: 0),byRounding: [.topLeft,.bottomRight]))
            .layout(scrollView) { (make) in
                make.top.equalTo(imgView.snp.bottom).offset(10)
                make.left.equalTo(10)
                make.width.equalTo(LYScreenSize.width-20)
                make.height.equalTo((LYScreenSize.width-20)/2.1)
            }
        
        let img1 = img.ly_cropping(to: CGRect(x: 0, y: 0, width: img.size.height, height: img.size.height))
        let img2 = img1?.ly_cornerImage(CGSize(width: (img1?.size.height ?? 100)/2, height: 0))
        let imgView2 = UIImageView()
            .contentMode(.scaleAspectFit)
            .image(img2)
            .layout(scrollView) { (make) in
                make.top.equalTo(imgView1.snp.bottom).offset(10)
                make.left.equalTo(10)
                make.width.equalTo((LYScreenSize.width-20)/2.1)
                make.height.equalTo((LYScreenSize.width-20)/2.1)
            }
        
        let img3 = img.ly_composeImageWithWatermark(#imageLiteral(resourceName: "icon"), imageFrame: CGRect(x: 50, y: 50, width: 50, height: 50))
        
        let imgView3 = UIImageView()
            .contentMode(.scaleAspectFit)
            .image(img3)
            .layout(scrollView) { (make) in
                make.top.equalTo(imgView2.snp.bottom).offset(10)
                make.left.equalTo(10)
                make.width.equalTo(LYScreenSize.width-20)
                make.height.equalTo((LYScreenSize.width-20)/2.1)
            }
        
        let img4 = img.ly_resizeImage(changedSize: CGSize(width: 10, height: 10/2.1))
        let imgView4 = UIImageView()
            .contentMode(.scaleAspectFit)
            .image(img4)
            .layout(scrollView) { (make) in
                make.top.equalTo(imgView3.snp.bottom).offset(10)
                make.left.equalTo(10)
                make.width.equalTo(LYScreenSize.width-20)
                make.height.equalTo((LYScreenSize.width-20)/2.1)
            }
        
        LYAppLog(img.jpegData(compressionQuality:1)?.count)
        let imgData = img.ly_compressImage(10)
        LYAppLog(imgData?.count)
        let img5 = UIImage(data: imgData!)
        
        let imgView5 = UIImageView()
            .contentMode(.scaleAspectFit)
            .image(img5)
            .layout(scrollView) { (make) in
                make.top.equalTo(imgView4.snp.bottom).offset(10)
                make.left.equalTo(10)
                make.width.equalTo(LYScreenSize.width-20)
                make.height.equalTo((LYScreenSize.width-20)/2.1)
        
            }
        
        UIImageView()
            .contentMode(.scaleAspectFit)
            .image(UIColor.blue.ly_image())
            .layout(scrollView) { (make) in
                make.top.equalTo(imgView5.snp.bottom).offset(10)
                make.left.equalTo(10)
                make.width.equalTo(LYScreenSize.width-20)
                make.height.equalTo((LYScreenSize.width-20)/2.1)
                make.bottom.equalTo(-10)
            }

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "截长图", style: .plain, target: self, action: #selector(screenShot))
        
    }
    
    @objc func screenShot() {
        scrollView.ly_screenShot { image in
            UIImageWriteToSavedPhotosAlbum(image!, self, #selector(self.image(image:didFinishSavingWithError:contextInfo:)), nil)
        }
    }
    
    @objc func image(image: UIImage, didFinishSavingWithError error: NSError?, contextInfo:UnsafeRawPointer){
        if error == nil {
            LYAppLog("保存成功")
        } else {
            LYAppLog("保存失败")
        }
    }
}
