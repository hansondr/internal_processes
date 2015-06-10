FactoryGirl.define do
  factory :company, class: UserData::Company do
    sequence(:name) { |n| "Company #{n}" }
  end

  factory :department, class: UserData::Department do
    sequence(:name) { |n| "Department #{n}" }
    company
  end

  factory :team, class: UserData::Team do
    sequence(:name) { |n| "Team #{n}" }
    description "A sample team"
    department
  end

  factory :team_membership, class: UserData::TeamUser do
    user
    team
  end

  factory :user, class: UserData::User do
    sequence(:first_name) { |n| "First #{n}" }
    sequence(:last_name) { |n| "Last #{n}" }
    sequence(:email) { |n| "#{first_name}.#{last_name}#{n}@example.com" }

    trait :in_team do
      transient do
        team { create :team }
        manager false
      end

      after :create do |user, evaluator|
        create :team_membership, user: user, team: evaluator.team
      end
    end

    trait :manages_team do
      transient do
        team { create :team }
      end

      after :create do |user, evaluator|
        create :team_membership, user: user, team: evaluator.team, manager: true
      end
    end
  end
end
