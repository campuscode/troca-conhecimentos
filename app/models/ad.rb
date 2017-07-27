class Ad < ApplicationRecord
  has_many :proposals
  belongs_to :user
end
