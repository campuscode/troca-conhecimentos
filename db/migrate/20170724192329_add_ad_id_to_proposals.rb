class AddAdIdToProposals < ActiveRecord::Migration[5.1]
  def change
    add_reference :proposals, :ad, foreign_key: true
  end
end
