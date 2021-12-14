class RemovePictureFromDoctors < ActiveRecord::Migration[6.1]
  def change
    remove_column :doctors, :picture
  end
end
