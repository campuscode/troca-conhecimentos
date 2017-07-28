class CreateProfileReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :profile_reviews do |t|
      t.integer :rating
      t.text :comment
      t.references :profile, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
