require 'rails/generators'

module Champollion
  module Generators
    class ViewsGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../../app/views", __FILE__)
      desc "Copies all Champollion views into your application's views"

      def copy_views
        view_directory "champollion/translations"
        view_directory "layouts/champollion"
      end
     
      protected

      def view_directory(name)
        directory name, "app/views/champollion/#{name}"
      end 

    end
  end
end
