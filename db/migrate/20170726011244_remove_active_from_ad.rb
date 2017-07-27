class RemoveActiveFromAd < ActiveRecord::Migration[5.1]
  def change
    remove_column :ads, :active, :string
  end
end
