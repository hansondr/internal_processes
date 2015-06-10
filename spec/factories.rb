FactoryGirl.define do
  factory :user, class: UserData::User do
    first_name 'John'
    last_name 'Doe'
    email 'john.doe@americanfinancing.net'
  end
end