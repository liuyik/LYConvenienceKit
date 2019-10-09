//
//  ViewController.swift
//  LYConvenienceKitDome
//
//  Created by 刘毅 on 2019/10/1.
//  Copyright © 2019 LYConvenienceKit. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    var data = [["UILable(包含设置圆角边框等)","UIButton","UIImageView","UITextView","UITextField","UICollectionViewAndColor"],["NSMutableAttributedString"]]
    
    var data2:[[InitType]] = [[InitType.label,InitType.button,InitType.imageView,InitType.textView,InitType.textField,InitType.collectionView],[InitType.string]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isTranslucent = false
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

    
    //MARK: - UITableViewDelegate,UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.ly_dequeueReusableCell(UITableViewCell.self, indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.ly_dequeueReusableHeaderFooter(TabHeaderView.self)
        view?.titlLabel?.text = section == 0 ? "View" : "Sting"
        return view
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = ViewInitController()
        vc.initType = data2[indexPath.section][indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
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
