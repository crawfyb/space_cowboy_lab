require('pry')
require_relative('./models/space_cowboy.rb')

SpaceCowboy.delete_all()


cowboy1 = SpaceCowboy.new({
  "name" => "John Shame",
  "favourite_weapon" => "Rubber Duck",
  "bounty_value" => 1000,
  'homeworld' => "Alderaun"
  })

cowboy2 = SpaceCowboy.new({
  "name" => "Billy the Knub",
  "favourite_weapon" => "Toy Shark",
  "bounty_value" => 3000,
  'homeworld' => "New Moonicow"
  })

cowboy3 = SpaceCowboy.new({
  "name" => "Sundance Adult",
  "favourite_weapon" => "Slinky",
  "bounty_value" => 10,
  'homeworld' => "Flexus"
  })

cowboy1.save()
cowboy2.save()
cowboy3.save()

cowboy1.favourite_weapon = "Dummy"

cowboy1.update()

# SpaceCowboy.delete(9)

test_fbn = SpaceCowboy.find_by_name('Sundance Adult')
SpaceCowboy.find_cowboy_by_id(33)
binding.pry
nil
