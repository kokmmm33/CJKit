Pod::Spec.new do |s|
    s.name         = "CJKit" # 项目名称
    s.version      = "0.1.3"        # 版本号 与 你仓库的 标签号 对应
    s.license      = "MIT"          # 开源证书
    s.summary      = "私有组件库" # 项目简介
    
    s.description  = <<-DESC
    A short description of CJKit.A short description of CJKit.
    DESC
    
    s.homepage     = "https://github.com/kokmmm33/CJKit" # 你的主页
    s.source       = { :git => "https://github.com/kokmmm33/CJKit.git", :tag => "#{s.version}" }#你的仓库地址，不能用SSH地址
    s.source_files = 'Main/**/*'
    
    s.requires_arc = true # 是否启用ARC
    s.platform     = :ios, "9.0" #平台及支持的最低版本
    s.swift_version = '4.0'
    
    s.frameworks   = "UIKit", "Foundation"
    
    s.dependency "Moya", "~> 11.0.2"
    s.dependency "Kingfisher", "~> 4.8.1"
    s.dependency "HandyJSON", "~> 4.2.0-beta1"
    s.dependency "SwiftyJSON", "~> 4.1.0"

    
    # User
    s.author             = { "Joseph" => "joseph7011@163.com" } # 作者信息
    s.social_media_url   = "http://kokmmm33.github.io" # 个人主页
    
end
