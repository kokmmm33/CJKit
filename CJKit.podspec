#
# Be sure to run `pod lib lint CJKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CJKit'
  s.version          = '0.1.1'
  s.summary          = 'A Common Module'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!


  s.description  = <<-DESC
  A short description of CJKit.A short description of CJKit.
  DESC
  
  s.homepage         = 'https://github.com/kokmmm33/CJKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Joseph' => 'joseph7011@163.com' }
  s.source           = { :git => 'https://github.com/kokmmm33/CJKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CJKit/Classes/**/*'
  
  s.platform = :ios, '8.0'
  s.swift_version = '4.2'
  
  s.dependency "Moya", "~> 12.0.1"
  s.dependency "Kingfisher", "~> 4.10.1"
  s.dependency "HandyJSON", "~> 4.2.1"
  s.frameworks = 'UIKit'

  
  # s.resource_bundles = {
  #   'CJKit' => ['CJKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.dependency 'AFNetworking', '~> 2.3'
end
