Pod::Spec.new do |s|
  s.name                    = "Magellan"
  s.version                 = "1.1.2"
  s.source                  = { :git => "https://github.com/akane/Magellan.git",
  		     	                    :tag => s.version.to_s }

  s.summary                 = "An app routing system to define your app navigation with ease."
  s.description             = "Simple navigation to abstract UIViewController navigation inside the app. Highly customizable and flexible."
  s.homepage                = "https://github.com/akane/Magellan"
  s.license                 = { :type => "MIT", :file => "LICENSE" }
  s.author                  = 'pjechris', 'akane'

  s.ios.deployment_target   = "8.0"
  s.swift_version           = "4.2"
  s.source_files            = "Sources/#{s.name}/**/*.swift"
  s.prefix_header_file      = "Sources/#{s.name}.h"
  s.requires_arc            = true
end
