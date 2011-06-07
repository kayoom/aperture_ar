Gem::Specification.new do |s|
  s.name        = "aperture_ar"
  s.version     = "0.0.1"
  s.date        = Time.now.strftime("%Y-%m-%d")
  s.authors     = ["Marian Theisen"]
  s.email       = 'marian@cice-online.net'
  s.summary     = "Read your Aperture Library"
  s.homepage    = "http://github.com/cice/aperture_ar"
  s.description = "Read your Aperture Library"

  s.files        =  Dir["**/*"] -
                    Dir["coverage/**/*"] -
                    Dir["rdoc/**/*"] -
                    Dir["doc/**/*"] -
                    Dir["sdoc/**/*"] -
                    Dir["rcov/**/*"]

  s.add_dependency 'activerecord', '~> 3.0.7'
  s.add_dependency 'sqlite3'

  s.add_development_dependency 'rspec', '>= 2.6.0'
end
