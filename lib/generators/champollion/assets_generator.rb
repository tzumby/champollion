require 'rails/generators'

module Champollion
  module Generators
    class AssetsGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../../app/assets", __FILE__)
      desc "Copies all Champollion assets into your application's assets"

      def copy_assets
        asset_directory "stylesheets/champollion"
        asset_directory "javascripts/champollion"
      end

      protected

      def asset_directory(name)
        directory name, "app/assets/#{name}"
      end
    end
  end
end
