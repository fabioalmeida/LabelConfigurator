
Pod::Spec.new do |s|
  s.name             = 'LabelConfigurator'
  s.version          = '0.2.0'
  s.summary          = 'The most simple way to configure your UILabels in one go'
  s.description      = <<-DESC
The most simple way to configure your UILabels in one go.
This Library was created to help on the configuration of UILabels on iOS apps.
With this, you can set all your configurations like UIFonts, spacings, UITextColors and so on in one command.
It also helps on the hard task of adding different style to substrings.
                       DESC
  s.homepage         = 'https://github.com/fabioalmeida/LabelConfigurator'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fabioalmeida' => 'fabio.andre.almeida@gmail.com' }
  s.source           = { :git => 'https://github.com/fabioalmeida/LabelConfigurator.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/fabioacalmeida'

  s.ios.deployment_target = '9.0'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0' }

  s.source_files = 'LabelConfigurator/Classes/**/*'
end
