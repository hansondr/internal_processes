RSpec.describe 'company admin', type: :feature do
  it 'allows for the creation of companies' do
    visit 'user_admin/companies'

    click_link 'New Company'

    fill_in 'Name', with: 'Test Company'

    click_button 'Create Company'

    expect(page).to have_text 'Test Company', count: 1
  end

  it 'allows for the modification of companies' do
    company = create :company, name: 'Alpha'

    visit 'user_admin/companies'

    click_link 'Alpha'

    fill_in 'Name', with: 'Beta'

    click_button 'Update Company'

    expect(page).to have_text 'Beta', count: 1
    expect(page).not_to have_text 'Alpha'
  end
end