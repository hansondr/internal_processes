class CreateUserDataUsers < ActiveRecord::Migration
  def change
    create_table :user_data_users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :image

      t.timestamps null: false
    end
  end
end
