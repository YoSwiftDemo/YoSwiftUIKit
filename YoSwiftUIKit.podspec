
Pod::Spec.new do |s|
# 项目名
s.name             = 'YoSwiftUIKit'
# 版本号
s.version          = '0.1.1'
# 简单描述
s.summary          = 'Yo UIView of swift'
# 详细描述
s.description      = <<-DESC
自定义视图+扩展
DESC
# 项目的主页
s.homepage         = 'https://github.com/YoSwiftKing/YoSwiftUIKit'
# s.screenshots    = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
# 项目遵守的协议
s.license          = { :type => 'MIT', :file => 'LICENSE' }
# 作者的邮箱
s.author           = { 'Yo' => '738816656@qq.com' }
# git仓库的https地址
s.source           = { :git => 'https://github.com/YoSwiftKing/YoSwiftUIKit.git', :tag => s.version.to_s }
# s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
# 项目的最低版本支持
s.ios.deployment_target = '9.0'

# 子模块引用 https://www.jianshu.com/p/951952f3be7a
s.default_subspec = 'YoUIColor+Normal'
#  分页标签view
s.subspec 'YoPageTagsView'  do |ss|
ss.source_files = 'YoSwiftUIKit/Classes/YoUIView/YoPageTagsView/**/*'
ss.dependency 'YoSwiftUIKit/YoUIImage+Color'
#ss.dependency 'YoSwiftUIKit/YoPageView'
ss.dependency 'YoFoundation/YoString+Size' #, '~> 1.0.2'
end

# YoUIView -YoUIView -分页view
s.subspec 'YoPageView'  do |ss|
ss.source_files = 'YoSwiftUIKit/Classes/YoUIView/YoPageView/**/*'
ss.dependency 'YoSwiftUIKit/YoUIView+Layout'
ss.dependency 'YoSwiftUIKit/YoUIColor+Rgb'
end
# YoUIView -渐变色扩展
s.subspec 'YoUIView+Gradient'  do |ss|
ss.source_files = 'YoSwiftUIKit/Classes/YoUIView/YoUIView+Gradient/**/*'
#ss.dependency 'YoCommon/Configure'

end
# YoUIView - 布局扩展
s.subspec 'YoUIView+Layout'  do |ss|
ss.source_files = 'YoSwiftUIKit/Classes/YoUIView/YoUIView+Layout/**/*'
#ss.dependency 'YoCommon/Configure'

end
# YoUIColor - 常用扩展
s.subspec 'YoUIColor+Normal'  do |ss|
ss.source_files = 'YoSwiftUIKit/Classes/YoUIColor/YoUIColor+Normal/**/*'
ss.dependency 'YoSwiftUIKit/YoUIColor+HexColor'

end

# YoUIView - Hex扩展
s.subspec 'YoUIColor+HexColor'  do |ss|
ss.source_files = 'YoSwiftUIKit/Classes/YoUIColor/YoUIColor+HexColor/**/*'
#ss.dependency 'YoCommon/Configure'


end
# YoUIColor - RGB扩展
s.subspec 'YoUIColor+Rgb'  do |ss|
ss.source_files = 'YoSwiftUIKit/Classes/YoUIColor/YoUIColor+Rgb/**/*'
#ss.dependency 'YoCommon/Configure'
end
# YoUIImage - color扩展
s.subspec 'YoUIImage+Color'  do |ss|
ss.source_files = 'YoSwiftUIKit/Classes/YoUIImage/YoUIImage+Color/**/*'
#ss.dependency 'YoCommon/Configure'
end
end




