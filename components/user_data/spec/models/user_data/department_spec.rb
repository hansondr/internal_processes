RSpec.describe UserData::Department, type: :model do
  it { is_expected.to validate_presence_of :name }

  it { is_expected.to belong_to :company }
  it { is_expected.to have_many :teams }

  describe 'enforces uniqueness of name within companies' do
    subject { build :department }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive.scoped_to(:company_id) }
  end
end
