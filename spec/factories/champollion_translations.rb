FactoryGirl.define do
  factory :champollion_translation, :class => 'Champollion::Translation' do
    locale "MyString"
    key "MyString"
    value "MyText"
  end

end
