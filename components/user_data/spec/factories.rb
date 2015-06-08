FactoryGirl.define do
  factory :company, class: 'UserData::Company' do
    sequence(:name) { |n| "Company #{n}" }
  end

  factory :department, class: 'UserData::Department' do
    sequence(:name) { |n| "Department #{n}" }
    company
  end
end