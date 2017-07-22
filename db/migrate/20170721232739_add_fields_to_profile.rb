class AddFieldsToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :city, :string
    add_column :profiles, :state, :string
    add_column :profiles, :skills, :text
    add_column :profiles, :photo, :string
  end
end
