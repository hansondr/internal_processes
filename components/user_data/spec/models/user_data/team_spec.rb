RSpec.describe UserData::Team, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :description }

  it { is_expected.to belong_to :department }
  it { is_expected.to have_many :members }
  it { is_expected.to have_many :managers }

  describe 'enforces uniqueness of team names within a department' do
    subject { build :team }
    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:department_id).case_insensitive }
  end

  it 'has team members' do
    team = create(:team)
    user_a = create(:user, :in_team, team: team)
    user_b = create(:user, :in_team, team: team)
    user_c = create(:user)

    expect(team.members).to contain_exactly user_a, user_b
  end

  it 'has team managers' do
    team = create(:team)
    user_a = create(:user, :in_team, team: team)
    user_b = create(:user, :manages_team, team: team)

    expect(team.managers).to contain_exactly user_b
  end
end
