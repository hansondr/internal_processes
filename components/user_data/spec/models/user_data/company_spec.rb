RSpec.describe UserData::Company, type: :model do
  it { should validate_presence_of :name }

  context 'enforces uniqueness of company names' do
    it 'when creating a new company' do
      create(:company, name: 'Example')
      expect { create(:company, name: 'Example') }.to raise_uniqueness_violation
    end

    it 'when updating a company' do
      create(:company, name: 'Example')
      company = create(:company, name: 'Foo')
      expect { company.update!(name: 'Example') }.to raise_uniqueness_violation
    end
  end
end
