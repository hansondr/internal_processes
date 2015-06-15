RSpec.describe 'department admin', type: :feature do
  before { sign_in }

  it 'allows for the creation of departments' do
    company = create(:company, name: 'Test Company')

    visit '/user_admin/departments'

    click_link 'New Department'
    fill_in 'Name', with: 'Test Department'
    select company.name, from: :department_company_id
    click_button 'Create Department'

    expect(page).to have_text company.name, count: 1
  end

  it 'allows for the modification of departments' do
    company_a = create(:company, name: 'Company A')
    company_b = create(:company, name: 'Company B')
    department = create(:department, name: 'Dept. A', company: company_a)

    visit '/user_admin/departments'
    expect(page).to have_text department.name, count: 1
    click_link department.name
    fill_in 'Name', with: 'Dept. B'
    select company_b.name, from: :department_company_id
    click_button 'Update Department'

    expect(page).to have_text 'Dept. B', count: 1
    expect(page).not_to have_text 'Dept. A'
  end
end