# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "deleting old seeds"
Team.destroy_all
Contract.destroy_all
Player.destroy_all
User.destroy_all
League.destroy_all

puts "creating users"
50.times do
    User.create(username: Faker::Internet.username, password: "password", email: Faker::Internet.email)
end
puts "creating leagues"
4.times do
    League.create(name: Faker::Esport.league)
end

puts "creating players"
all_teams = NHL::Team.all
all_teams.map do |team|
    team.roster.map do |player_inst|
       player = NHL::Player.find(player_inst.id)
       Player.create(full_name: player.full_name, current_team_name: player.current_team_name, primary_position_name: player.primary_position_name, primary_number: player.primary_number, shoots_catches: player.shoots_catches, birth_date: player.birth_date, nationality: player.nationality, height: player.height, weight: player.weight, image: player.image)
    end
end

puts "creating teams"
all_teams = NHL::Team.all
all_teams.map do |team|
    Team.create(name: team.name, user_id: User.all.sample.id, league_id: League.all.sample.id)
end

puts "creating contracts"
124.times do
    Contract.create(team_id: Team.all.sample.id, player_id: Player.all.sample.id)
end
puts "done go forth and proser"