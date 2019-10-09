# [LYConvenienceKit](https://github.com/liuyik/LYConvenienceKit.git) -- Swift5.0

[![Platform](http://img.shields.io/badge/platform-iOS-blue.svg?style=flat)](http://cocoapods.org/?q=LYConvenienceKit)
![Language](https://img.shields.io/badge/language-swift-orange.svg?style=flat)


## 支持pod导入：

```
pod 'LYConvenienceKit'
```



## 简单使用：（注：可下载demo具体查看） 
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

## 结尾语：

- 使用过程中发现bug请issues
- 有新的需求欢迎提出；


