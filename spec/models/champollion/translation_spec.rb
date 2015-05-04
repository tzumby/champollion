require 'spec_helper'

module Champollion
  RSpec.describe Translation, :type => :model do

    it "Does not allow the creation of invalid Translation record" do
      expect(FactoryGirl.build(:translation, locale: "")).to be_invalid
    end

    it "Create a translation record with valid parameters" do
      expect(FactoryGirl.build(:translation)).to be_valid
    end  

    it "Returns a hash with all translations" do
      Translation.create([
        {locale: :en, key: 'about.home_button', value: 'test'},
        {locale: :en, key: 'home.welcome_heading', value: 'test'},
        {locale: :en, key: 'services.web_design.service_one', value: 'Photoshop'}
      ])

      expected_hash = {
        en: {
          about: {
            home_button: 'test'
          },
          home: {
            welcome_heading: 'test'
          },
          services: {
            web_design: {
              service_one: 'Photoshop'
            }
          }
        }
      }

      expect(Translation.all_translations).to eq(expected_hash)
    end

  end
end
