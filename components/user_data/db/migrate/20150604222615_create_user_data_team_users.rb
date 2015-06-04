class CreateUserDataTeamUsers < ActiveRecord::Migration
  def change
    create_table :user_data_team_users do |t|
      t.references :team, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.boolean :manager, default: false

      t.timestamps null: false
    end
  end
end
