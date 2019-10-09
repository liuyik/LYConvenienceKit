Pod::Spec.new do |spec|

  spec.name         = "LYConvenienceKit"
  spec.version      = "1.0.0"
  spec.summary      = "A short description of LYConvenienceKit."
  spec.homepage     = "https://github.com/liuyik/LYConvenienceKit.git"

  spec.license      = "MIT"
 
  spec.author             = { "刘毅" => "352601605@qq.com" }
  
  spec.source       = { :git => "https://github.com/liuyik/LYConvenienceKit.git", :tag => "1.0.0" }
  spec.source_files = "LYConvenienceKit/", "*.swift"
  spec.resources    = "LYConvenienceKit/*.png"
  spec.exclude_files = "Classes/Exclude"

  spec.swift_version = '5.0'


end
