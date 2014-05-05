require 'rake/testtask'
require 'rdoc/task'

RDoc::Task.new do |rd|
  rd.main = 'CSSMin-cli'
  rd.title = 'CSSMin-cli'
  rd.rdoc_dir = 'doc'

  rd.rdoc_files.include('lib/**/*.rb')
end

Rake::TestTask.new do |t|
  t.libs.push 'lib'
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

task :default => [:test]
