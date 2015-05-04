require 'spec_helper'

module Champollion
  RSpec.describe Translation, :type => :model do

    it "Does not allow the creation of invalid Translation record" do
      expect(FactoryGirl.build(:translation, locale: "")).to be_invalid
    end

    it "Create a translation record with valid parameters" do
      expect(FactoryGirl.build(:translation)).to be_valid
    end  

  end
end
