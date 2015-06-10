RSpec.describe 'users admin', type: :feature do
  it 'allows for the creation of users' do
    sign_in

    visit '/user_admin/users'

    click_link 'New User'

    fill_in 'First name', with: 'Sample'
    fill_in 'Last name', with: 'User'
    fill_in 'Email', with: 'sample@example.com'

    click_button 'Create User'

    expect(page).to have_text 'Sample User', count: 1
  end
end