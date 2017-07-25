class CreateProposals < ActiveRecord::Migration[5.1]
  def change
    create_table :proposals do |t|
      t.text :description
      t.text :requested_knowledge
      t.string :email
      t.string :day_period
      t.string :meeting_type

      t.timestamps
    end
  end
end
