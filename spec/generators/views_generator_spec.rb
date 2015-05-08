require 'spec_helper'
require "generator_spec"
require "generators/champollion/views_generator"

TMP_ROOT = File.expand_path("../../tmp", __FILE__)

describe Champollion::Generators::ViewsGenerator, type: :generator do
  destination TMP_ROOT
  arguments %w(views)

  before(:all) do
    prepare_destination
    run_generator
  end

  specify do
    expect(destination_root).to have_structure {
      directory 'app/views/champollion/champollion/translations' do
        file '_form.html.erb'
        file 'index.html.erb'
        file 'edit.html.erb'
        file 'new.html.erb'
      end

      directory 'app/views/champollion/layouts/champollion' do
        file 'application.html.erb'
        file '_navigation.html.erb'
      end
    }
  end

end
