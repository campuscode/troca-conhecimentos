FactoryGirl.define do
  factory :ad do
    title 'Aprender Violão Urgente'
    requested_knowledge 'Aprender violão'
    offered_knowledge 'Ensinar Ruby on Rails'
    meeting_type 'Presencial'
    day_period 'A noite'
    location 'No metrô'
    avaliability 'Em janeiro'
    status :active
    user
  end
end
