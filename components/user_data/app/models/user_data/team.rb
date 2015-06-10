module UserData
  class Team < ActiveRecord::Base
    belongs_to :department

    has_many :team_users
    has_many :members, -> { where(user_data_team_users: { manager: false }) },
                       through: :team_users, source: :user
    has_many :managers, -> { where(user_data_team_users: { manager: true }) },
                        through: :team_users, source: :user

    validates :name, presence: true, uniqueness: { scope: :department_id, case_sensitive: false }
    validates :description, presence: true
  end
end
