Pod::Spec.new do |s|
  s.name                    = "Magellan"
  s.version                 = "1.1.2"
  s.source                  = { :git => "https://github.com/akane/Magellan.git",
  		     	                    :tag => s.version.to_s }

  s.summary                 = "Define your navigation through routes in one and powerful way"
  s.description             = "Navigation Service to route your controllers based on parameters. Asbtract everything about NavigationController. No need to care about it!"
  s.homepage                = "https://github.com/akane/Magellan"
  s.license                 = { :type => "MIT", :file => "LICENSE" }
  s.author                  = 'pjechris', 'akane'

  s.ios.deployment_target   = "8.0"
  s.source_files            = "Sources/#{s.name}/**/*.swift"
  s.prefix_header_file      = "Sources/#{s.name}.h"
  s.requires_arc            = true
end
