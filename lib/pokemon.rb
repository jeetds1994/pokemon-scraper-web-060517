require "sqlite3"

class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(pokemon)
    @name = pokemon
    @type = type
    @db = db
  end

  def self.db
    db = SQLite3::Database.new "db/pokemon.db"
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}');")
  end

  def self.find(id, db)
    query = "SELECT * FROM pokemon WHERE pokemon.id = (?)"
    results = db.execute(query, id).flatten
    new_pokemon = Pokemon.new(results[1])
    new_pokemon.type = results[2]
    new_pokemon.id = results[0]
    new_pokemon

  end


end
