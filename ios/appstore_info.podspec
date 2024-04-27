#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint appstore_info.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'appstore_info'
  s.version          = '0.0.1'
  s.summary          = 'Present app store with corresponding app details inside the flutter app'
  s.description      = <<-DESC
Present app store with corresponding app details inside the flutter app
                       DESC
  s.homepage         = 'https://github.com/akshaynjarangal/appstore_info'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Akshay Njarangal' => 'akshayn010@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '11.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
