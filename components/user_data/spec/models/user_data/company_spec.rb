RSpec.describe UserData::Company, type: :model do
  it { should validate_presence_of :name }

  describe 'enforces uniqueness of company names' do
    subject { build :company }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  end
end
