class Profile < ApplicationRecord
  belongs_to :user
  validates :name, :birth_date, :city, :state, :skills, presence: true
end
