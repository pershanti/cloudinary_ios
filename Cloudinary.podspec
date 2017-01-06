Pod::Spec.new do |s|
  s.name         = "Cloudinary"
  s.version      = "2.0.0"
  s.summary      = "Cloudinary is a cloud service that offers a solution to a web application's entire image management pipeline."
  s.description  = <<-DESC
    Easily upload images to the cloud. Automatically perform smart image resizing, cropping and conversion without installing any complex software. 
    Integrate Facebook or Twitter profile image extraction in a snap, in any dimension and style to match your website’s graphics requirements. 
    Images are seamlessly delivered through a fast CDN, and much much more. 
    Cloudinary offers comprehensive APIs and administration capabilities and is easy to integrate with any web application, existing or new.
    Cloudinary provides URL and HTTP based APIs that can be easily integrated with any Web development framework. 
  DESC
  s.homepage     = "http://cloudinary.com"
  s.license      = "MIT"
  s.author       = { "Cloudinary" => "info@cloudinary.com" }
  s.platform     = :ios
  s.ios.deployment_target = '8.0'
  s.source       = { :git => "http://git.zemingo.com/Cloudinary/CloudinarySDK-iOS.git", :tag => s.version.to_s }

  s.dependency 'Alamofire', '~> 3.5.1'
  
  #
  # Create the dummy CLDCrypto.framework structures
  #
  s.prepare_command = <<-CMD
  touch prepare_command.txt
  echo 'Running prepare_command'
  pwd
  echo Running GenerateCLDCryptoModule
  xcrun --toolchain com.apple.dt.toolchain.Swift_2_3 --sdk macosx swift ./CLDCrypto/GenerateCLDCryptoModule.swift iphonesimulator .
  xcrun --toolchain com.apple.dt.toolchain.Swift_2_3 --sdk macosx swift ./CLDCrypto/GenerateCLDCryptoModule.swift iphoneos .  

  CMD

  s.framework = "UIKit", "Foundation"
  s.source_files = "Cloudinary/**/*.swift"

  s.preserve_paths = "Cloudinary/Frameworks/CLDCrypto/**/*"
  s.xcconfig = {    
    "SWIFT_INCLUDE_PATHS"         => '$(PROJECT_DIR)/Cloudinary/Cloudinary/Frameworks/CLDCrypto/$(PLATFORM_NAME)',
    "FRAMEWORK_SEARCH_PATHS"      => '$(PROJECT_DIR)/Cloudinary/Cloudinary/Frameworks/CLDCrypto/$(PLATFORM_NAME)'
  }
  
end