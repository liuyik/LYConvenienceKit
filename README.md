## [LYConvenienceKit](https://github.com/liuyik/LYConvenienceKit.git) -- Swift5.0

[![Platform](http://img.shields.io/badge/platform-iOS-blue.svg?style=flat)](http://cocoapods.org/?q=LYConvenienceKit)
![Language](https://img.shields.io/badge/language-swift-orange.svg?style=flat)

### 支持pod导入：

```
pod 'LYConvenienceKit'
```
### 使用说明：

LYConvenienceKit依赖了[SnapKit](https://github.com/SnapKit/SnapKit.git)和[Alamofire](https://github.com/Alamofire/Alamofire.git)两个框架，pod时会导入这两个框架

### 简单使用：（注：可下载[demo](https://github.com/liuyik/LYConvenienceKit.git)具体查看） 
也可以查看[文档](https://liuyik.github.io/LYConvenienceKit)

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
UIColor

```
//颜色样式 
public enum LYColorStyle: Int {
        ///默认文字颜色#000000
        case defaulted = 0x000000
        ///用于标题文字 #1F1F1F
        case title = 0x1F1F1F
        ///用于普通级文字信息 #333333
        case content = 0x333333
        ///用于次级文字信息 #666666
        case secondary = 0x666666
        ///用于提示性文字，未编辑状态时的文字颜色 #999999
        case placeholder = 0x999999
        ///用于文字选中、可点击状态 #157EFB
        case click = 0x157EFB
        ///用于特别强调和突出文字 #FF2600
        case emphasize = 0xFF2600
        ///用于导航栏底部的分割线颜色，部分按钮描边色 #DADADA
        case navigationLine = 0xDADADA
        ///用于分割线颜色，以及框的描边，按钮点击色 #E5E5E5
        case partingLine = 0xE5E5E5
        ///用于内容区域的背景底色 #F5F5F5
        case backgroundView = 0xF5F5F5
}

//使用
UIColor(.title)
//16进制颜色
UIColor(0xFFFFFF)
```

NSMutableAttributedString

```
let astr:NSMutableAttributedString = str.ly.attributedString()//String -> NSAttributedString
            astr.mixtureAttributString(LYMixtureAttribute(string: "红色", color: .red, font: UIFont.systemFont(ofSize: 20)))//设置属性文本
                .mixtureAttributString(LYMixtureAttribute(string: "蓝色", color: .blue, font: UIFont.systemFont(ofSize: 25)))//设置属性文本
                .addUnderline(.yellow)//添加下滑线
                .addStrikethrough(.yellow)//添加删除线
                .addImage(#imageLiteral(resourceName: "YELLOW2d"), bounds: CGRect(x: 0, y: 0, width:40, height: 40))//添加图片(默认添加到最后，position添加到具体位置)
                .changeLineSpace(50)//修改行距
                .markerStringOf(LYMixtureAttribute(string: "b", color: .yellow, font: UIFont.systemFont(ofSize: 30)))//标记第一个子串
                .markerAllStringOf(LYMixtureAttribute(string: "4", color: .orange, font: UIFont.systemFont(ofSize: 30)))//标记所有子串
            
            lable1.attributedText(astr)
```

更具体的下载[demo](https://github.com/liuyik/LYConvenienceKit.git)查看

### 代码块使用

你也可以结合代码块达到更高效率的编程，代码块上传到项目里了，[点击下载](https://gitee.com/liuyit/LYConvenienceKit/raw/master/CodeSnippets.zip)

1.打开访达，Command + Shift + G. 前往如下路径的文件夹

2.路径 : ~/Library/Developer/Xcode/UserData/CodeSnippets

3.把下载下来的文件复制到这个文件里，没有这个文件的在UserData下创建一个CodeSnippets文件

4.重启xcode，就可以使用了

![](https://gitee.com/liuyit/blog/raw/blogImg/img/CodeSnippets.png)

## 参考

[SnapKit](https://github.com/SnapKit/SnapKit.git)
[Alamofire](https://github.com/Alamofire/Alamofire.git)
## 结尾语：

- 使用过程中发现bug请提出
- 有新的需求欢迎提出；
- 由于gitup有时下载慢，我把项目也放到了[gitee](https://gitee.com/liuyit/LYConvenienceKit)上。

