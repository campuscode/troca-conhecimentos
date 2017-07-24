class AddUserRefToAd < ActiveRecord::Migration[5.1]
  def change
    add_reference :ads, :user, foreign_key: true
  end
end
