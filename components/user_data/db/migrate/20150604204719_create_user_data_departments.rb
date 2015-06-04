class CreateUserDataDepartments < ActiveRecord::Migration
  def change
    create_table :user_data_departments do |t|
      t.belongs_to :company, index: true, foreign_key: true, null: false
      t.string :name, null: false
      t.string :description

      t.timestamps null: false
    end
  end
end
