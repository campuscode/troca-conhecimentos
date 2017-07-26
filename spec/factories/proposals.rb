FactoryGirl.define do
  factory :proposal do
    description "Minha proposta"
    requested_knowledge "O que quero aprender..."
    email "email@email.com"
    day_period "Qualquer periodo"
    meeting_type "Qualquer formato"
  end
end
