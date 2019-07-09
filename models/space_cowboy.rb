require('pg')
class SpaceCowboy

  attr_accessor :id, :name, :favourite_weapon, :bounty_value, :homeworld

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @favourite_weapon = options['favourite_weapon']
    @bounty_value = options['bounty_value'].to_i
    @homeworld = options['homeworld']
  end

  def save
    db =PG.connect({dbname: 'space_cowboy', host: 'localhost'})
    sql = "INSERT INTO space_cowboy (name, favourite_weapon, bounty_value, homeworld)
    VALUES ($1, $2, $3, $4)
    RETURNING id;"
    db.prepare('save', sql)
    values = [@name, @favourite_weapon, @bounty_value, @homeworld]
    cowboys = db.exec_prepared('save', values)
    @id = cowboys.first['id']
    db.close()
  end

  def update
        db =PG.connect({dbname: 'space_cowboy', host: 'localhost'})
        sql = "UPDATE space_cowboy
               SET (name, favourite_weapon, bounty_value, homeworld)
               = ($1, $2, $3, $4)
               WHERE id = $5"
               values = [@name, @favourite_weapon, @bounty_value, @homeworld, @id]
        db.prepare('update', sql)
        db.exec_prepared('update', values)
        db.close
  end

  def self.delete(id)
  db = PG.connect({dbname: 'space_cowboy', host: 'localhost'})
  sql = "DELETE FROM space_cowboy WHERE id  = $1"
  values = [id]
  db.prepare('delete', sql)
  db.exec_prepared('delete', values)
  db.close
end

def self.delete_all()
  db = PG.connect({dbname: 'space_cowboy', host: 'localhost'})
  sql = "DELETE FROM space_cowboy;"
  db.prepare('delete_all', sql)
  db.exec_prepared('delete_all')
  db.close
end

end
