module UserData
  class Company < ActiveRecord::Base
    validates :name, presence: true, uniqueness: { case_sensitive: false }

    has_many :departments
  end
end
