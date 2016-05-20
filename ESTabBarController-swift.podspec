Pod::Spec.new do |s|
s.name              = 'ESTabBarController-swift'
s.module_name       = 'ESTabBarController'
s.version           = '1.0.2'
s.license           = { :type => "MIT", :file => "LICENSE" }
s.summary           = 'An easy way to customize tabBarController and tabBarItem.'
s.homepage          = 'https://github.com/eggswift/ESTabBarController'
s.authors           = { "lihao" => "lihao_ios@hotmail.com"}
s.source            = {:git => "https://github.com/eggswift/ESTabBarController.git", :tag => "v#{s.version}" }
s.ios.deployment_target = '8.0'
s.source_files = 'ESTabBarController/*.swift'
end
