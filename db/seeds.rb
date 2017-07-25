# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(email: 'usuario@usuarios.com', password: '123456')
Ad.create(requested_knowledge: 'Aprender violão', offered_knowledge: 'Ensinar Ruby on Rails', meeting_type: 'Presencial', day_period: 'A noite', location: 'No metrô', avaliability: 'Em janeiro', active: true, user: user)
