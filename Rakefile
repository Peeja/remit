require "bundler/gem_tasks"
require 'spec/rake/spectask'

desc 'Default: run specs.'
task :default => :spec

task :spec do
  Rake::Task["spec:units"].invoke
end

namespace :spec do
  desc "Run unit specs."
  Spec::Rake::SpecTask.new(:units) do |t|
    t.spec_opts   = ['--colour --format progress --loadby mtime --reverse']
    t.spec_files  = FileList['spec/units/**/*_spec.rb']
  end

  desc "Run integration specs. Requires AWS_ACCESS_KEY and AWS_SECRET_KEY."
  Spec::Rake::SpecTask.new(:integrations) do |t|
    t.spec_opts   = ['--colour --format progress --loadby mtime --reverse']
    t.spec_files  = FileList['spec/integrations/**/*_spec.rb']
  end
end

Spec::Rake::SpecTask.new(:doc) do |t|
  t.spec_opts   = ['--format specdoc --dry-run --colour']
  t.spec_files  = FileList['spec/**/*_spec.rb']
end
