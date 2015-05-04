# champollion
Champollion is a Rails engine that allows storing I18n translation in a database.

## Rails 4.2

Add the gem in your Gemfile:

gem 'i18n-active_record'
gem 'champollion'

Mount it in your routes.rb

mount Champollion::Engine => '/champ'
