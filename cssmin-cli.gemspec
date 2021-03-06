Gem::Specification.new do |s|
  s.name = "cssmin-cli"
  s.version = "1.0.2"
  s.date = "2014-05-05"
  s.summary = "Command line tool for minifying CSS."
  s.description = "Command line tool for minifying CSS. Based on CSSMin library."

  s.authors = ["Jan Ferko"]
  s.email = "jan.ferko3@gmail.com"
  s.license = "BSD"

  s.homepage = "http://github.com/iref/cssmin-cli"

  s.files = `git ls-files`.split($/)
  s.test_files = s.files.grep(%r{^test/})
  s.executables << 'cssmin'
  s.require_path = 'lib'
  s.has_rdoc = true

  s.required_ruby_version = ">= 1.8.6"

  s.add_runtime_dependency "cssmin"
  s.add_runtime_dependency "mercenary"

  s.add_development_dependency "rake"
  s.add_development_dependency "minitest"

end
