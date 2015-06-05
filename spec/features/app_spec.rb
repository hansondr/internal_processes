RSpec.describe "Engine mounting", type: :feature do
  it 'mounts user_admin_ui' do
    visit '/user_admin/users'
    expect(page).to have_title 'Admin'
  end
end
