RSpec.describe "Engine mounting", type: :feature do
  it 'mounts user_admin_ui' do
    sign_in
    visit 'user_admin/users'
    expect(page).to have_title 'Admin'
  end
end
