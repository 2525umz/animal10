# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'hiyoko@jp',
   password: '252525'
)

genres = [
   { name: '0歳児'},
   { name: '1歳児'},
   { name: '2歳児'},
   { name: '3歳児'},
   { name: '4歳児'}.
   { nemw: '5歳児'}
   ]
   Genre.create(genres)