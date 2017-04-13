Pod::Spec.new do |s|
s.name             = 'Bubbles'
s.version          = '0.1.5'
s.summary          = 'Bubble picker Apple Music'

s.description      = <<-DESC
Bubble picker like the Apple Music genre selection.
DESC

s.homepage         = 'https://github.com/cristinasitaa/Bubbles.git'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Cristina Sita' => 'cristinasitaa@gmail.com' }
s.source           = { :git => 'https://github.com/cristinasitaa/Bubbles.git', :tag => s.version.to_s }

s.ios.deployment_target = '10.0'
s.source_files = 'Bubbles/*'

end
