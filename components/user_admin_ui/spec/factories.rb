FactoryGirl.define do
  factory :company, class: 'UserData::Company' do
    name 'Example Company'
  end

  factory :department, class: 'UserData::Department' do
    name 'Example Department'
    company
  end

  factory :user, class: UserData::User do
    first_name 'John'
    last_name 'Doe'
    email 'john.doe@americanfinancing.net'
  end
end