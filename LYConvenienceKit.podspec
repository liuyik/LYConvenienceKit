Pod::Spec.new do |spec|

  spec.name         = "LYConvenienceKit"
  spec.version      = "1.0.5"
  spec.summary      = "链式编程创建UI,和一些常用的func"
  spec.homepage     = "https://github.com/liuyik/LYConvenienceKit.git"

  spec.license      = "MIT"
 
  spec.author             = { "刘毅" => "352601605@qq.com" }
  
  spec.source       = { :git => "https://github.com/liuyik/LYConvenienceKit.git", :tag => "1.0.5" }
  spec.source_files = "LYConvenienceKit/*.swift"
  spec.resources    = "LYConvenienceKit/*.png"
  spec.exclude_files = "Classes/Exclude"

  spec.swift_version = '5.0'

  spec.requires_arc = true

  spec.ios.deployment_target = "10.0"
  
  spec.dependency 'SnapKit'
  spec.dependency 'Kingfisher'
end
