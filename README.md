[![Code Climate](https://codeclimate.com/github/tzumby/champollion/badges/gpa.svg)][codeclimate]
[![Build Status](https://travis-ci.org/tzumby/champollion.svg?branch=master)][travis]
[![Test Coverage](https://codeclimate.com/github/tzumby/champollion/badges/coverage.svg)][codecoverage]

[travis]: https://travis-ci.org/tzumby/champollion
[codeclimate]: https://codeclimate.com/github/tzumby/champollion
[codecoverage]: https://codeclimate.com/github/tzumby/champollion/coverage


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

### Views and Assets

#### Twitter Bootstrap
Add the the bootstrap-sass gem to your Gemfile

```
gem 'bootstrap-sass'
```

By default Champollion expects you to install Twitter Bootstrap inside your main application. All the views utilize Twitter Bootstrap ids and classes but you also have the option to generate the views and customize them to your own needs. 

To copy over the assets files run the following inside your host application

```
bundle exec rails g champollion:assets
```

This command will create the following files and folders:

* app/assets/javascripts/champollion
  * application.js
* app/assets/stylesheets/champollion
  * application.css
  * base.css

Assuming you want to use Twitter Bootstrap to style the views you will have to perform a few steps. This guide assumes you are using the 'bootstrap-sass' gem. 

* Rename your app/assets/stylesheets/champollion/application.css to app/assets/stylesheets/champollion/application.scss
* Include twitter bootstrap in your champollion css manifest:
* 
  ```
  @import "bootstrap-sprockets";
  @import "bootstrap";
  
  body { padding-top: 60px;}
  ```

### Interpolations
Interpolations work as you would expect. Create your key and value as you normally would in your locale yml files:

* key: 'home.hello'
* value: 'Welcome %{name}'
* interpolations: name

In your view translate it with 

```
<%= t ('home.hello', name: "Jack") %>
```

This will result in : "Welcome Jack"

### Lambdas
Lambdas work as expected as well, define your translation as follows:

* key: 'salutation'
* value: 'Proc.new { |values| values.first == 'm' ? "Mr. %{name}" : "Mrs. %{name}" }'
* interpolations: name
* is_proc: true


```
<%= t('salutation', {:gender => "m", :name => "Paul"}) %>
```

This will result in "Mr. Paul"


### Switching locales using URL parameters
One common way to switch language based on parameters would be to create an Application controller before filter that sets the locale according to a params[:locale] parameter. 

```
# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :set_locale
 
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
```

Be sure to check out the [official Rails docs on I18n](http://guides.rubyonrails.org/i18n.html#setting-the-locale-from-the-url-params) for more examples. 

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

## TO DO

* Add pagination and search (filter by locale)
* Change locale input to a drop down and allow creation of the locales available
* Add support for environments (create translations for development, staging and production for example)
* Integrate with Devise for Authentication
