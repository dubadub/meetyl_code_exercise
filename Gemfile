source 'https://rubygems.org'
source 'https://rails-assets.org'

gem 'rails', '4.2.0.beta4'
gem 'pg'

# Formats
gem 'coffee-rails', '~> 4.1.0'
gem 'sass-rails', '~> 5.0.0.beta1'
gem 'slim-rails'

# Javascript
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails', '~> 4.0.0.beta2'

# Models
gem 'jbuilder', '~> 2.0'
%w{core constraints migrations transactions timestamps validations do-adapter rails active_model postgres-adapter}.each do |gem|
  gem "dm-#{gem}", :git => "https://github.com/datamapper/dm-#{gem}.git", :branch => 'release-1.2'
end
gem 'dm-paperclip'
gem 'elasticsearch-model'
gem 'elasticsearch-rails'

# Asset pipeline
gem 'rails-assets-bootstrap'


group :development, :test do
  gem 'byebug'
  gem 'guard-rspec', require: false
  gem 'rspec-rails', '~> 3.0.0'
  gem 'spring'
  gem 'web-console', '~> 2.0.0.beta4'
end

