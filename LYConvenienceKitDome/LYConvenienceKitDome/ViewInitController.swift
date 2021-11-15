//
//  ViewInitController.swift
//  LYConvenienceKitDome
//
//  Created by 刘毅 on 2019/10/8.
//  Copyright © 2019 LYConvenienceKit. All rights reserved.
//

import UIKit

class ViewInitController: UIViewController {

    deinit {
        codeTimer?.cancel()
        codeTimer = nil
        LYAppLog("ViewInitController释放")
    }
    var codeTimer : DispatchSourceTimer?
    
    var initType: InitType = .label
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor(.white)
        
        switch initType {
        
        case .label:
            createLable()
        case .button:
            createButton()
        case .imageView:
            createImageView()
        case .textView:
            createTextView()
        case .textField:
            createTextField()
        case .collectionView:
            createCollectionView()
        }
       
    }
}

//MARK: 创建Label
extension ViewInitController {
    
    func createLable() {
        let lable1 = UILabel()
            .text("test")
            .textColor(.red)
            .font(15)
            .numberOfLines(0)
            .textAlignment(.center)
            .layout(view) { (make) in
                make.top.equalTo(100)
                make.left.equalTo(100)
                make.right.equalTo(-100)
        }
        
        let lable2 = UILabel()
            .text("圆角,边框")
            .textColor(.white)
            .font(15)
            .textAlignment(.center)
            .backgroundColor(.blue)
            .layerRadius(50, true)
            .layerBorder(2, .red)
            .layout(view) { (make) in
                make.top.equalTo(lable1.snp.bottom).offset(100)
                make.left.equalTo(100)
                make.width.height.equalTo(100)
        }
        
        let lable3 = UILabel()
            .text("左圆角,右和上边框")
            .textColor(.white)
            .font(15)
            .numberOfLines(0)
            .textAlignment(.center)
            .backgroundColor(.blue)
            .layout(view) { (make) in
                make.top.equalTo(lable2.snp.bottom).offset(100)
                make.left.equalTo(100)
                make.width.height.equalTo(100)
        }
        //⚠️：设置部分圆角或边框时需要先设置frame
        lable3.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        lable3.ly.layerRoundingCorners(corners: [.topLeft,.bottomLeft], radius: 50)
        lable3.ly.layerBorder(color: .red, width: 2, type: [.right,.top])
    }
}

//MARK: 创建button
extension ViewInitController {
    
    func createButton() {
        
        UIButton()
            .title("normal")
            .title("highlighted", .highlighted)
            .titleColor(.red)
            .titleColor(.yellow,.highlighted)
            .addUnderline()
            .addUnderline(2)
            .backgroundColor(UIColor.blue)
            .font(20)
            .layout(view) { (make) in
                make.top.equalTo(50)
                make.left.equalTo(100)
                make.right.equalTo(-100)
                make.height.equalTo(40)
            }
        
        UIButton()
            .title("发送验证码")
            .backgroundColor(UIColor.blue)
            .font(20)
            .addClickTarget(self, action: #selector(codeClickAciton))
            .layout(view) { (make) in
                make.top.equalTo(100)
                make.left.equalTo(100)
                make.right.equalTo(-100)
                make.height.equalTo(40)
            }
        
        UIButton(frame: CGRect(x: 0, y: 0, width: LYScreenSize.width-100, height: 40))
            .title("图片在文字右边")
            .titleColor(.red)
            .image(#imageLiteral(resourceName: "YELLOW2d"))
            .font(15)
            .changeImagePosition(.right)
            .layout(view) { (make) in
                make.top.equalTo(200)
                make.left.equalTo(50)
                make.right.equalTo(-50)
                make.height.equalTo(40)
        }
        
        UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 100))
            .title("图片在文字上面")
            .titleColor(.red)
            .image(#imageLiteral(resourceName: "YELLOW2d"))
            .font(15)
            .changeImagePosition(.top)
            .layout(view) { (make) in
                make.top.equalTo(300)
                make.centerX.equalToSuperview()
                make.width.equalTo(150)
                make.height.equalTo(100)
        }
        
    }
    
    //点击发送验证码
    @objc func codeClickAciton(_ codeBtn : UIButton) {
        codeTimer = codeBtn.ly_countDown(60)
    }
    
}

//MARK: 创建imageView
extension ViewInitController {
    
    func createImageView() {
        UIImageView()
            .image(#imageLiteral(resourceName: "YELLOW2d"))
            .contentMode(.center)
            .layout(view) { (make) in
                make.top.equalTo(50)
                make.left.equalTo(50)
                make.width.height.equalTo(40)
            }
        
        let imgView = UIImageView()
            .layout(view) { (make) in
                make.top.equalTo(100)
                make.left.right.equalToSuperview()
                make.height.equalTo(120)
            }
//        imgView.ly_setKfImage("")
//        imgView.ly_setKfImage("https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic.52112.com%2F180413%2F180413_4%2FRAfngtFLy3_small.jpg&refer=http%3A%2F%2Fpic.52112.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1639211162&t=428a19f6ca9872fff18eff2f32654365","bg001")
        imgView.ly_setKfImage("https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic.52112.com%2F180413%2F180413_4%2FRAfngtFLy3_small.jpg&refer=http%3A%2F%2Fpic.52112.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1639211162&t=428a19f6ca9872fff18eff2f32654365", placeholder: #imageLiteral(resourceName: "bg001"))
    }
    
}

//MARK: 创建textView
extension ViewInitController {
    
    func createTextView() {
        
        let textView = UITextView()
            .textColor(.red)
            .font(25)
//            .text("test")
            .placeholder("请输入文字")
            .editable(true)
            .scrollEnabled(true)
            .layout(view) { (make) in
                make.top.equalTo(100)
                make.left.equalTo(100)
                make.right.equalTo(-100)
                make.height.equalTo(100)
        }
        
        if #available(iOS 11.0, *) {
            textView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
    }
    
}

//MARK: 创建textField
extension ViewInitController {
    
    func createTextField() {
        UITextField()
            .placeholder("请输入文字")
            .text("test")
            .textColor(.red)
            .font(25)
            .layout(view) { (make) in
                make.top.equalTo(100)
                make.left.equalTo(100)
                make.right.equalTo(-100)
        }
        
        UITextField()
            .placeholder("请输入手机号码")
            .textColor(.red)
            .keyboardType(.phonePad)
            .font(25)
            .layout(view) { (make) in
                make.top.equalTo(200)
                make.left.equalTo(100)
                make.right.equalTo(-100)
        }
    }
}

//MARK: 创建collectionView
extension ViewInitController {
    
    func createCollectionView() {
        let layout = UICollectionViewFlowLayout()
            .minimumLineSpacing(10)
            .minimumInteritemSpacing(10)
            .itemSize(CGSize(width: 100, height: 40))
            .scrollDirection(.vertical)
            .sectionInset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
            .headerReferenceSize(CGSize(width: 200, height: 40))
        
        let collectView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
            .backgroundColor(.white)
            .delegate(self)
            .dataSource(self)
            .registerCellClass(UICollectionViewCell.self)
            .registerHeaderFooterClass(ColHeaderView.self)
            .layout(view) { (make) in
                make.edges.equalToSuperview()
            }
        
        if #available(iOS 11.0, *) {
            collectView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
    }
}
let colors:[UIColor.LYColorStyle] = [UIColor.LYColorStyle.defaulted,
                                     UIColor.LYColorStyle.title,
                                     UIColor.LYColorStyle.content,
                                     UIColor.LYColorStyle.secondary,
                                     UIColor.LYColorStyle.placeholder,
                                     UIColor.LYColorStyle.click,
                                     UIColor.LYColorStyle.emphasize,
                                     UIColor.LYColorStyle.navigationLine,
                                     UIColor.LYColorStyle.partingLine,
                                     UIColor.LYColorStyle.backgroundView]

//MARK: - UICollectionViewDelegate,UICollectionViewDataSource
extension ViewInitController:UICollectionViewDelegate,UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
       return colors.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.ly_dequeueReusableCell(UICollectionViewCell.self, indexPath)
        if indexPath.section == 0 {
            cell.backgroundColor = UIColor(colors[indexPath.row])
        }else {
            cell.backgroundColor = UIColor.ly_randomColor
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.ly_dequeueReusableHeaderFooter(ColHeaderView.self, kind,indexPath)
        if indexPath.section == 0 {
            headerView.titlLabel?.text = "颜色"
        }else {
            headerView.titlLabel?.text = "随机颜色"
        }
        return headerView
    }
}


class ColHeaderView: UICollectionReusableView {
    var titlLabel:UILabel?
    override init(frame: CGRect) {
        super.init(frame: frame)
        titlLabel = UILabel()
        .boldFont(17)
        .layout(self, snapMaker: { (make) in
            make.edges.equalToSuperview()
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
