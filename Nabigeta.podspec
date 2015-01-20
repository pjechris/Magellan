Pod::Spec.new do |s|
  s.name		  = "Nabigeta"
  s.version		  = "0.3.0"
  s.source		  = { :git => "https://github.com/akane/Nabigeta.git",
  		     	    :tag => s.version.to_s }

  s.summary          	  = "Define your navigation through routes in one and powerful way"
  s.description           = "Navigation Service to route your controllers based on parameters. Asbtract everything about NavigationController. No need to care about it !"
  s.homepage              = "https://github.com/akane/Nabigeta"
  s.license		  = { :type => "MIT", :file => "LICENSE" }
  s.author                = 'pjechris', 'akane'

  s.ios.deployment_target = "7.0"
  s.source_files    	  = "#{s.name}/**/*.swift"
  s.prefix_header_file    = "#{s.name}/#{s.name}.h"
  s.requires_arc 	  = true

  s.dependency		  "JLRoutes", "~> 1.x" 
end
