class AddActiveToAd < ActiveRecord::Migration[5.1]
  def change
    add_column :ads, :active, :boolean
  end
end
