[![Code Climate](https://codeclimate.com/github/tzumby/champollion/badges/gpa.svg)][codeclimate]
[![Build Status](https://travis-ci.org/tzumby/champollion.svg?branch=master)][travis]

[travis]: https://travis-ci.org/tzumby/champollion
[codeclimate]: https://codeclimate.com/github/tzumby/champollion

# Champollion
Champollion is a Rails engine that allows storing I18n translation in a database. The engine also integrates with front-end Angular translations by providing a controller action with a json response that a plugin like  [angular-translate](https://github.com/angular-translate/angular-translate "Angular Translate")  can pick up and use.

## Rails 4.2

Add the gem in your Gemfile. Note that for now you will have to include the i18n-active_record gem as a dependency in the Rails application because the latest stable gem is on a separate git repository.

```
gem 'i18n-active_record', :git => 'git://github.com/svenfuchs/i18n-active_record.git', :require => 'i18n/active_record'
gem 'champollion'
```

Mount it in your routes.rb

```
mount Champollion::Engine => '/champollion'
```

Import migrations in your Rails application

```
bundle exec rake champollion:install:migrations
```

Run the migrations

```
bundle exec rake db:migrate
```

### Revisions
This engine uses the paper_trail gem to keep track of translation versions and authors. The default views will show all the revision dates and authors.

Paper trail will use the current_user variable if available and use it when creating a revision record. Restoring a previous version is not currently implemented.

### Angular-translate
When you configure your translate provider in Angular set the following configuration options:

```
$translateProvider.preferredLanguage('en');
$translateProvider.useStaticFilesLoader({
  prefix: '/champollion/translations', // this has to match the endpoint where you mounted the engine.  
  suffix: '.json'    
});
```

## Note
This gem is still under active development and not production ready.
