# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "deleting old seed"
Team.destroy_all
Contract.destroy_all
Player.destroy_all
User.destroy_all
League.destroy_all

puts "creating user"
User.create(username: Faker::Internet.username, password: "password", email: Faker::Internet.email)

puts "creating league"
League.create(name: "NHL")

puts "creating team"
Team.create(name: "Florida Panthers", user_id: User.all.first.id, league_id: League.all.first.id)

puts "creating player"
player = NHL::Player.find("Keith Yandle")
Player.create(full_name: player.full_name, current_team_name: player.current_team_name, primary_position_name: player.primary_position_name, primary_number: player.primary_number, shoots_catches: player.shoots_catches, birth_date: player.birth_date, nationality: player.nationality, height: player.height, weight: player.weight, image: player.image)

puts "creating contracts"
Contract.create(team_id: Team.all.first.id, player_id: Player.all.first.id)
puts "done go forth and proser"