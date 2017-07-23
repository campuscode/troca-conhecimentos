class RemoveAddressFromProfile < ActiveRecord::Migration[5.1]
  def change
    remove_column :profiles, :address, :string
  end
end
