[![Code Climate](https://codeclimate.com/github/tzumby/champollion/badges/gpa.svg)](https://codeclimate.com/github/tzumby/champollion)

# Champollion
Champollion is a Rails engine that allows storing I18n translation in a database. The engine also integrates with front-end Angular translations by providing a controller action with a json response that a plugin like  [angular-translate](https://github.com/angular-translate/angular-translate "Angular Translate")  can pick up and use.

## Rails 4.2

Add the gem in your Gemfile:

```
gem 'i18n-active_record'
gem 'champollion'
gem 'paper_trail', '~> 4.0.0.beta'
```

Mount it in your routes.rb

```
mount Champollion::Engine => '/champollion'
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
