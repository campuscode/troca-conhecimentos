class CreateAds < ActiveRecord::Migration[5.1]
  def change
    create_table :ads do |t|
      t.string :requested_knowledge
      t.string :offered_knowledge
      t.string :meeting_type
      t.string :day_period
      t.string :location
      t.string :avaliability

      t.timestamps
    end
  end
end
