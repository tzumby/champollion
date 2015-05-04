FactoryGirl.define do
  factory :translation, :class => 'Champollion::Translation' do
    locale "MyString"
    key "MyString"
    value "MyText"
  end
end
