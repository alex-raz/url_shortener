source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'bootsnap', '>= 1.4.4', require: false # Reduces boot times through caching;
gem 'pg', '~> 1.1' # Use postgresql as the database for Active Record
gem 'puma', '~> 5.0' # Use Puma as the app server
gem 'rails', '~> 6.1.4'
gem 'sass-rails', '>= 6' # Use SCSS for stylesheets

group :development, :test do

end

group :development do
  gem 'rack-mini-profiler', '~> 2.0' # Display performance information in your browser.
  gem 'listen', '~> 3.3' # listens to file modifications and notifies you about the changes
  gem 'spring' # Spring speeds up development by keeping your application running in the background.
end
