FactoryGirl.define do
  factory :company, class: 'UserData::Company' do
    name 'Example Company'
  end

  factory :department, class: 'UserData::Department' do
    name 'Example Department'
    company
  end
end