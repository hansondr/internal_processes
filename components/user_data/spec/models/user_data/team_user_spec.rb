RSpec.describe UserData::TeamUser, type: :model do
  it { should belong_to :team }
  it { should belong_to :user }
end
