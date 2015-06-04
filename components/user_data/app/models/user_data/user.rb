module UserData
  class User < ActiveRecord::Base
    has_many :team_users
    has_many :teams, through: :team_users

    validates :first_name, :last_name, :email, presence: true
  end
end
