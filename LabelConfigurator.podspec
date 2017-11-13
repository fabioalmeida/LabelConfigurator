
Pod::Spec.new do |s|
  s.name             = 'LabelConfigurator'
  s.version          = '0.1.0'
  s.summary          = 'The most simple way to configure your UILabels in one go'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
The most simple way to configure your UILabels in one go.
This Library was created to help on the configuration of UILabels on iOS apps.
With this, you can set all your configurations like UIFonts, spacings, UITextColors and so on in one command.
It also helps on the hard task of adding different style to substrings. 
                       DESC

  s.homepage         = 'https://github.com/fabioalmeida/LabelConfigurator'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fabioalmeida' => 'fabio.almeida@farfetch.com' }
  s.source           = { :git => 'https://github.com/fabioalmeida/LabelConfigurator.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/fabioacalmeida'

  s.ios.deployment_target = '8.0'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0' }

  s.source_files = 'LabelConfigurator/Classes/**/*'
end
