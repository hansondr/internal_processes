RSpec.describe UserData::User, type: :model do
  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.to validate_presence_of :last_name }
  it { is_expected.to validate_presence_of :email }

  it { is_expected.to have_many :teams }
  it { is_expected.to have_many :managed_teams }

  describe 'enforces uniqueness of user emails' do
    subject { build :user }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end

  it 'belongs to teams' do
    team_a = create(:team)
    team_b = create(:team)
    team_c = create(:team)
    user = create(:user)
    create(:team_membership, user: user, team: team_a)
    create(:team_membership, user: user, team: team_c)

    expect(user.teams).to contain_exactly team_a, team_c
  end

  it 'manages teams' do
    team_a = create(:team)
    team_b = create(:team)
    team_c = create(:team)
    user = create(:user)
    create(:team_membership, user: user, team: team_a, manager: true)
    create(:team_membership, user: user, team: team_b)
    create(:team_membership, user: user, team: team_c, manager: true)

    expect(user.managed_teams).to contain_exactly team_a, team_c
  end
end
