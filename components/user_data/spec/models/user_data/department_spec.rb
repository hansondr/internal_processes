RSpec.describe UserData::Department, type: :model do
  it { should validate_presence_of :name }

  it { should belong_to :company }
end
