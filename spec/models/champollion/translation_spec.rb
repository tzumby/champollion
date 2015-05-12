require 'spec_helper'

module Champollion
  RSpec.describe Translation, :type => :model do

    let(:valid_parameters) {
      [
        {locale: :en, key: 'about.home_button', value: 'test'},
        {locale: :en, key: 'home.welcome_heading', value: 'test'},
        {locale: :en, key: 'services.web_design.service_one', value: 'Photoshop'},
        {locale: :fr, key: 'about.home_button', value: 'oui'}
      ]
    } 

    let(:nested_translations) {[
      { locale: :en, key: 'activerecord.errors.models.champollion/translation.attributes.locale.blank', value: 'Locale cannot be blank'},
      { locale: :en, key: 'activerecord.errors.models.champollion/translation.attributes.key.blank', value: 'Key cannot be blank'},
      { locale: :en, key: 'activerecord.errors.models.champollion/translation.attributes.value.blank', value: 'Value cannot be blank'}
    ]}

    it "Does not allow the creation of invalid Translation record" do
      expect(FactoryGirl.build(:translation, locale: "")).to be_invalid
    end

    it "Create a translation record with valid parameters" do
      expect(FactoryGirl.build(:translation)).to be_valid
    end  

    it "Returns a hash with nested translations" do
      Translation.create(nested_translations)

      expected_hash = {
        en: {
          activerecord: {
            errors: {
              models: {
                :"champollion/translation" => {
                  attributes: {
                    locale: { blank: "Locale cannot be blank"},
                    key: { blank: "Key cannot be blank" },
                    value: { blank: "Value cannot be blank"}
                  }
                }
              }
            }
          }
        }
      }

      expect(Translation.all_hash).to eq(expected_hash)
    end

    it "Returns a hash with all translations" do
      Translation.create(valid_parameters)

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
        },
        fr: {
          about: {
            home_button: 'oui'
          }
        }
      }

      expect(Translation.all_hash).to eq(expected_hash)
    end

    it "Returns the last five revisions" do
      translation = FactoryGirl.build(:translation)
      translation.update_attributes({:value => "New Value"})
      translation.update_attributes({:value => "Another change"})
      translation.update_attributes({:value => "Third change"})
      translation.update_attributes({:value => "Fourth change"})
      translation.update_attributes({:value => "Fifth change"})
      translation.update_attributes({:value => "Sixth change"})

      expect(translation.versions.size).to eq(6)
      expect(translation.last_five.size).to eq(5)
    end

  end
end
