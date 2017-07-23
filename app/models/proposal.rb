class Proposal < ApplicationRecord
    validates :description, :requested_knowledge, :email, :day_period, 
              :meeting_type, presence: {message: 'Houve um erro ao tentar enviar a proposta'}
    belongs_to :user
end
