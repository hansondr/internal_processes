RSpec.describe UserData::Team, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }

  it { should belong_to :department }
  it { should have_many :team_users }
  it { should have_many :users }
end
