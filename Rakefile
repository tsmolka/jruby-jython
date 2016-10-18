require "rubygems"
require "bundler/setup"
require "bundler/gem_tasks"

dist_dir = File.expand_path("../dist", __FILE__)
directory dist_dir
ant_file = 'jython/build.xml'

namespace :jython do
  require 'ant'
  ['jar-standalone'].each do |target|
    desc "Jython Ant target \"#{target}\""
    task target do
      ant "-f #{ant_file} -Ddist.dir=\"#{dist_dir}\" #{target}"
    end
  end
end

desc "run specs"
task :spec do
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new
end

task :default do
  system("rake -T")
end

# Clean
require 'rake/clean'
CLEAN << dist_dir
