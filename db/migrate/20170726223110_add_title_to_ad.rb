class AddTitleToAd < ActiveRecord::Migration[5.1]
  def change
    add_column :ads, :title, :string
  end
end
