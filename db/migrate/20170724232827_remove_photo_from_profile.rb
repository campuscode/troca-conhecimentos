class RemovePhotoFromProfile < ActiveRecord::Migration[5.1]
  def change
    remove_column :profiles, :photo, :string
  end
end
