require 'bundler/gem_tasks'

desc "Build the gem"
task :build do
  system "gem build whiplash-batches-api.gemspec"
end

desc "Build and release the gem"
task :release => :build do
  system "gem push whiplash-batches-api-#{Whiplash::Batches::VERSION}.gem"
end
