require "paper_trail"
require "bootstrap_form"
require "kaminari"

module Champollion
  class Engine < ::Rails::Engine
    isolate_namespace Champollion

    config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end

  end
end
