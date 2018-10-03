Club.create(name: "HCCA", homeground: "Williamson county park")
Club.create(name: "RRCC", homeground: "Dell Diamond Park")
Team.create(name: "Dark Knights", club_id: 1)
Team.create(name: "ABT", club_id: 1)
Team.create(name: "Longhorns", club_id: 1)
Team.create(name: "Cowboys", club_id: 1)

11.times do
  Photo.create(name: Faker::Name.name, team_id: 1)
end

11.times do
  Photo.create(name: Faker::Name.name, team_id: 2)
end

11.times do
  Photo.create(name: Faker::Name.name, team_id: 3)
end

11.times do
  Photo.create(name: Faker::Name.name, team_id: 4)
end
