class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_many :proposals
  delegate :name, to: :profile

  has_many :ads

  def my_proposals
    active_ads = ads.where(active: true)
    Proposal.where(ad: active_ads)
  end
end
