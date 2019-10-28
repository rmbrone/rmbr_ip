#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flutter_ip'
  s.version          = '0.2.0'
  s.summary          = 'Flutter plugin - Get ip address for wifi, cellular and wire.'
  s.description      = <<-DESC
Flutter plugin - Get ip address for wifi, cellular and wire.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.swift_version = '4.0'

  s.ios.deployment_target = '8.0'
end

