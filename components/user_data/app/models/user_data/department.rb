module UserData
  class Department < ActiveRecord::Base
    belongs_to :company
    has_many :teams

    validates :name, presence: true, uniqueness: { scope: :company_id, case_sensitive: false }
  end
end
