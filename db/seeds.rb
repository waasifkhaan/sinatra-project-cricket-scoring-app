Club.create(name: "HCCA", homeground: "Williamson county park")
Club.create(name: "RRCC", homeground: "Dell Diamond Park")
Team.create(name: "Dark Knights", club_id: 14)
Team.create(name: "ABT", club_id: 14)
Team.create(name: "Longhorns", club_id: 14)
Team.create(name: "Cowboys", club_id: 14)

11.times do
  Player.create(name: Faker::Name.name, team_id: 70)
end

11.times do
  Player.create(name: Faker::Name.name, team_id: 71)
end

11.times do
  Player.create(name: Faker::Name.name, team_id: 72)
end

11.times do
  Player.create(name: Faker::Name.name, team_id: 73)
end
