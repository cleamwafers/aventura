# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(email:"cleam@yahoo.co.jp",password:"121212")

Genre.create([
    { genre_name: 'ヨーロッパ・アメリカ' },
    { genre_name: 'アフリカ' },
    { genre_name: 'アジア・オセアニア'},
    ])
    
