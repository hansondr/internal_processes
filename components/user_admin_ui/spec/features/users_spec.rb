RSpec.describe 'users admin', type: :feature do
  it 'allows for the creation of users' do
    visit '/user_admin/users'

    click_link 'New User'

    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Doe'
    fill_in 'Email', with: 'john.doe@example.com'

    click_button 'Create User'

    expect(page).to have_text 'John Doe', count: 1
  end
end