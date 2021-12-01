class CreateDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors do |t|
      t.string :fullname
      t.string :specialty
      t.string :city
      t.string :picture
      t.timestamps
      t.references :user, null: false, foreign_key: true
    end
  end
end
