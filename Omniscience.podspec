Pod::Spec.new do |s|
  version = "0.1.0"

  s.name         = "Omniscience"
  s.version      = version
  s.summary      = "Allogy KVO module. Allogy is the study of everything. Omniscience is the observation of everything."
  s.homepage     = "http://allogy.com/Omniscience"

  s.license      = {
    :type => 'Allogy Interactive',
    :text => <<-LICENSE
              Copyright (c) 2012 Allogy Interactive. All rights reserved.
    LICENSE
  }

  s.author       = { "Richard Venable" => "rvenable@allogy.com" }
  s.source       = { :git => "https://github.com/Allogy/Omniscience.git", :tag => version }
  s.platform     = :ios, '5.0'
  s.source_files = 'Omniscience/**/*.{h,m}'
  s.framework  = 'Foundation'
  s.requires_arc = true

  s.dependency 'MAKVONotificationCenter'

end
