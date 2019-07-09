require('pry')
require_relative('./models/space_cowboy.rb')

SpaceCowboy.delete_all()


cowboy1 = SpaceCowboy.new({
  "name" => "John Shame",
  "favourite_weapon" => "Rubber Duck",
  "bounty_value" => 1000,
  'homeworld' => "Alderaun"
  })

cowboy1.save()
cowboy1.favourite_weapon = "Dummy"

cowboy1.update()

SpaceCowboy.delete(9)

binding.pry
nil
