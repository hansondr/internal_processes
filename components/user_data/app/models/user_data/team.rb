module UserData
  class Team < ActiveRecord::Base
    belongs_to :department
    has_many :team_users
    has_many :users, through: :team_users

    validates :name, :description, presence: true
  end
end
