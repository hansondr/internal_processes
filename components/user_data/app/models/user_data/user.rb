module UserData
  class User < ActiveRecord::Base
    has_many :team_users
    has_many :teams, -> { where(user_data_team_users: { manager: false }) },
                     through: :team_users, source: :team
    has_many :managed_teams, -> { where(user_data_team_users: { manager: true }) },
                             through: :team_users, source: :team

    validates :first_name, :last_name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }
  end
end
