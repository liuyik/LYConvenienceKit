# [LYConvenienceKit](https://github.com/liuyik/LYConvenienceKit.git) -- Swift5.0

[![Platform](http://img.shields.io/badge/platform-iOS-blue.svg?style=flat)](http://cocoapods.org/?q=LYConvenienceKit)
![Language](https://img.shields.io/badge/language-swift-orange.svg?style=flat)

## 支持pod导入：

```
pod 'LYConvenienceKit'
```
## 使用说明：

LYConvenienceKit依赖了[SnapKit](https://github.com/SnapKit/SnapKit.git)和[Alamofire](https://github.com/Alamofire/Alamofire.git)两个框架，pod时会导入这两个框架

## 简单使用：（注：可下载demo具体查看） 
```
//这样导入一次后整个项目可用
@_exported import LYConvenienceKit
```
UILable
```
let lable = UILabel()
            .text("test")
            .textColor(.red)
            .font(15)
            .numberOfLines(0)
            .textAlignment(.center)
            .layout(view) { (make) in
                make.top.equalTo(100)
                make.left.equalTo(100)
        }                   
```

UITableView
```
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
```
## 参考
[SnapKit](https://github.com/SnapKit/SnapKit.git)
[Alamofire](https://github.com/Alamofire/Alamofire.git)
## 结尾语：

- 使用过程中发现bug请issues
- 有新的需求欢迎提出；


