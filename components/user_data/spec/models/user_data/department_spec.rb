RSpec.describe UserData::Department, type: :model do
  it { should validate_presence_of :name }

  it { should belong_to :company }

  context 'enforces uniqueness of department names within the same company' do
    it 'when creating a new department' do
      foo = create(:company)
      bar = create(:company)
      dept_in_foo = create(:department, company: foo)

      expect { create(:department, name: dept_in_foo.name, company: foo) }.to raise_uniqueness_violation
      expect { create(:department, name: dept_in_foo.name, company: bar) }.not_to raise_exception
    end

    it 'when updating a department\'s name' do
      company = create(:company)
      dept = create(:department, company: company)
      another_dept = create(:department, company: company)

      expect { another_dept.update!(name: dept.name) }.to raise_uniqueness_violation
      expect { another_dept.update!(name: "Not #{dept.name}") }.not_to raise_exception
    end

    it 'when updating a department\'s company' do
      foo = create(:company)
      bar = create(:company)
      dept_in_foo = create(:department, name: 'Sample', company: foo)
      dept_in_bar = create(:department, name: 'Sample', company: bar)

      expect { dept_in_bar.update!(company: foo) }.to raise_uniqueness_violation

      dept_in_foo.update!(name: "Not #{dept_in_foo.name}")
      expect { dept_in_bar.update!(company: foo) }.not_to raise_exception
    end
  end
end
