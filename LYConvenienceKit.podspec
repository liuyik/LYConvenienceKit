Pod::Spec.new do |spec|

  spec.name         = "LYConvenienceKit"
  spec.version      = "1.1.3"
  spec.summary      = "链式编程创建UI,和一些常用的func"
  spec.homepage     = "https://github.com/liuyik/LYConvenienceKit.git"

  spec.license      = "MIT"
 
  spec.author       = { "刘毅" => "352601605@qq.com" }
  
  spec.source       = { :git => "https://github.com/liuyik/LYConvenienceKit.git", :tag => spec.version }
  spec.source_files = "LYConvenienceKit/*.swift"
  spec.resources    = "LYConvenienceKit/LYConvenienceKit.bundle"

  spec.swift_version = '5.0'

  spec.requires_arc  = true

  spec.ios.deployment_target = "10.0"
  
  spec.dependency 'SnapKit',  '~> 5.0.1'
  spec.dependency 'Kingfisher', '~> 5.15.8'
end
