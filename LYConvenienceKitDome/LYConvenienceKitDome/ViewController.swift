//
//  ViewController.swift
//  LYConvenienceKitDome
//
//  Created by 刘毅 on 2019/10/1.
//  Copyright © 2019 LYConvenienceKit. All rights reserved.
//

import UIKit
@_exported import LYConvenienceKit

enum InitType {
    case label
    case button
    case imageView
    case textView
    case textField
    case collectionView
}

enum DataType {
    case string
    case attributedString
    case date
    case image
}

class ViewController: UIViewController {
    
    var titles : [String] = ["View","DataType"]
    
    var data1 = ["UILable(包含设置圆角边框等)","UIButton","UIImageView","UITextView","UITextField","UICollectionViewAndColor"]
    var data2 = ["String","AttributedString","Date","image"]
    
    var typeData1 = [InitType.label,InitType.button,InitType.imageView,InitType.textView,InitType.textField,InitType.collectionView]
    var typeData2 = [DataType.string,DataType.attributedString,DataType.date,DataType.image]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isTranslucent = false
        self.title = "LYConvenienceKit"
        //创建UITableView
        UITableView()
            .estimatedRowHeight(40)
            .separatorStyle(.singleLine)
            .delegate(self)
            .dataSource(self)
            .registerCellClass(UITableViewCell.self)
            .registerHeaderFooterClass(TabHeaderView.self)
            .layout(view) { (make) in
                make.edges.equalToSuperview()
            }
    }
}
 
//MARK: - UITableViewDelegate,UITableViewDataSource
extension ViewController : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {return data1.count}
        return data2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.ly_dequeueReusableCell(UITableViewCell.self, indexPath)
        if indexPath.section == 0 {
            cell.textLabel?.text = data1[indexPath.row]
        }else {
            cell.textLabel?.text = data2[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.ly_dequeueReusableHeaderFooter(TabHeaderView.self)
        view?.titlLabel?.text = titles[section]
        return view
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 {
            let vc = ViewInitController()
            vc.title = data1[indexPath.row]
            vc.initType = typeData1[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }else {
            let vc = DataController()
            vc.title = data2[indexPath.row]
            vc.dataType = typeData2[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

class TabHeaderView: UITableViewHeaderFooterView {
    var titlLabel:UILabel?
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
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
