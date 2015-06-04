class CreateUserDataCompanies < ActiveRecord::Migration
  def change
    create_table :user_data_companies do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
