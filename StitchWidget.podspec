Pod::Spec.new do |s|
  s.name             = 'StitchWidget'
  s.version          = '1.0.0'
  s.summary          = 'StitchWidget framework'

  s.description      = 'Common utilities'

  s.homepage         = 'https://github.com/princeprakash1997/StitchWidget'
  s.license          = { :type => 'MIT', :text => 'LICENSE' }
  s.authors          = { 'sudarvizhi' => 'sudarvizhi2611@gmail.com'}
  s.source           = { :git => 'https://github.com/StitchHQ/widgets-ios', :tag => s.version }

  s.platform         = :ios, '13.0'

  s.source_files = 'StitchWidget/StitchWidget/**/*.{swift,h,m}'
  s.resources = 'StitchWidget/StitchWidget/**/*.{xcdatamodeld,png,ttf,js,css,gif,xib,xcassets,bundle,json}'
  s.public_header_files = 'StitchWidget/StitchWidget/**/*.{h}'

  s.swift_version = "5.0"
  s.dependency 'Alamofire'
  s.dependency 'CryptoSwift'
end
