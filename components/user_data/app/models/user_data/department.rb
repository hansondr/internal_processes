module UserData
  class Department < ActiveRecord::Base
    belongs_to :company

    validates :name, presence: true
  end
end
