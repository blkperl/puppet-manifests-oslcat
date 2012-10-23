source :rubygems

puppetversion = ENV.key?('PUPPET_VERSION') ? "= #{ENV['PUPPET_VERSION']}" : ['>= 2.7']

gem 'puppet', puppetversion
gem 'librarian-puppet'

group :test do
  gem 'mocha', '>= 0.11.0'
  gem 'puppet-lint'
  gem 'rake', '>= 0.9.0'
  gem 'rspec', '>= 2.8.0'
  gem 'rspec-puppet', '>= 0.1.1'
end
