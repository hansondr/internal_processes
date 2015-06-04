class CreateUserDataTeams < ActiveRecord::Migration
  def change
    create_table :user_data_teams do |t|
      t.references :department, index: true, foreign_key: true
      t.string :name, null: false
      t.string :description, null: false

      t.timestamps null: false
    end
  end
end
