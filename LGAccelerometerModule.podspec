Pod::Spec.new do |spec|

  spec.name         = "LGAccelerometerModule"
  spec.version      = "0.0.1"
  spec.summary      = "加速度计组件."

  spec.description  = <<-DESC
  获取加速度
                   DESC

  spec.homepage     = "https://github.com/applekwork/LGAccelerometerModule.git"

  spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  spec.author             = { "LG" => "applekwork@163.com" }
  # Or just: spec.author    = "LG"
  # spec.authors            = { "LG" => "applekwork@163.com" }
  # spec.social_media_url   = "https://twitter.com/LG"

  spec.platform     = :ios
  spec.platform     = :ios, "8.0"
  
  spec.source       = { :git => "https://github.com/applekwork/LGAccelerometerModule.git", :tag => "#{spec.version}" }

  spec.source_files  = "Classes", "Classes/**/*.{h,m}"
  spec.exclude_files = "Classes/Exclude"

  spec.public_header_files = "Classes/**/*.h"

  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"

  # spec.framework  = "CoreMotion.framework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"


   spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"
end


