RSpec.describe UserData::Company, type: :model do
  it { should validate_presence_of :name }
end
