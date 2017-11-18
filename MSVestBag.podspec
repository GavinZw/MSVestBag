#
#  Be sure to run `pod spec lint MSVestBag.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "MSVestBag"
  s.version      = "0.0.1"
  s.license      =  { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "gavin" => "lovegavin@outlook.com" }
  s.homepage     = "https://github.com/GavinZw"
  s.summary      = "A short description of MSVestBag."

  s.ios.deployment_target = '8.0'
  s.source       = { :git => 'https://github.com/GavinZw/MSVestBag', :tag => s.version }


  s.source_files  = "MSVestBag", "MSVestBag/MSVestBag/*"
  s.frameworks = 'Foundation', 'UIKit'
  s.dependency  'JPush'
  s.dependency  'BmobSDK'
  s.dependency  'SDWebImage'

  s.requires_arc          = true

  s.description  = <<-DESC
                   DESC

end
