Pod::Spec.new do |s|
s.name              = 'ESTabBarController-swift'
s.version           = '2.8.0'
s.summary           = 'An easy way to customize tabBarController and tabBarItem.'
s.homepage          = 'https://github.com/eggswift/ESTabBarController'

s.license           = { :type => 'MIT', :file => 'LICENSE' }
s.authors           = { 'lihao' => 'lihao_ios@hotmail.com'}
s.social_media_url  = 'https://github.com/eggswift'
s.platform          = :ios, '8.0'
s.swift_versions    = ['5.0']
s.source            = {:git => 'https://github.com/eggswift/ESTabBarController.git', :tag => s.version}
s.source_files      = ['Sources/**/*.{swift}']
s.resources         = ['Sources/**/*.{lproj}']
s.requires_arc      = true
end
