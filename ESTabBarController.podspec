
Pod::Spec.new do |s|
s.name              = "ESTabBarController-swift"
s.version           = "1.0.0"
s.summary           = "An easy way to customize tabBarController and tabBarItem."
s.description       = "Highly customizable tabBarController and tabBarItem, you can easily customize ui style or add animation etc . Using swift!"
s.homepage          = "https://github.com/eggswift/ESTabBarController"

s.license           = { :type => "MIT", :file => "LICENSE" }
s.authors           = { "lihao" => "lihao_ios@hotmail.com"}
s.social_media_url  = "https://github.com/eggswift/"
s.platform          = :ios, "8.0"
s.source            = {:git => "https://github.com/eggswift/ESTabBarController.git", :tag => "1.0.0"}
s.source_files      = 'ESTabBarController/*.{swift}'
s.requires_arc      = true
end