require 'spec_helper'
require "generators/champollion/assets_generator"

TMP_ROOT = File.expand_path("../../tmp", __FILE__)

describe Champollion::Generators::AssetsGenerator, type: :generator do
  destination TMP_ROOT
  arguments %w(assets)

  before(:all) do
    prepare_destination
    run_generator
  end

  specify do
    expect(destination_root).to have_structure {
      directory 'app/assets/javascripts/champollion' do
        file 'application.js'
      end

      directory 'app/assets/stylesheets/champollion' do
        file 'application.css'
        file 'base.css'
      end
    }
  end
end
