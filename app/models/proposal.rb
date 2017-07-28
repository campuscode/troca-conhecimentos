class Proposal < ApplicationRecord

  belongs_to :user
  belongs_to :ad

    validates :description, :requested_knowledge, :email, :day_period,
              :meeting_type, presence:
              {message: 'Houve um erro ao tentar enviar a proposta' }

    enum status: [:pending, :approved, :rejected]

end
