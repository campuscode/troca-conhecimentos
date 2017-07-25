class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_many :proposals
  has_many :ads
  #has_many :received_proposals, through: :ad

  def my_proposals
    ads.find_by(active: true).proposals
  end

end
