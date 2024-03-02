# Design Patterns: Factory
# Example 1:
class Entity
  attr_reader :power, :name, :attack_range
  def initialize(power = 0, name = "Sin nombre", attack_range = 0)
  end

  def info()
  end
end

class Enemy1 < Entity
  name = "Enemy 1"
  power = 10
  attack_range = 10
  def info
    "#{name} - #{power} - #{attack_range}"
  end
end

class Enemy2 < Entity
  name = "Enemy 2"
  power = 20
  attack_range = 20
end

class Enemy3 < Entity
  def info
    name = "Enemy 3"
    power = 30
    attack_range = 30
    "#{name} - #{power} - #{attack_range}"
  end
end

class EnemyFactory
  attr_reader :enemy
  def createEnemy
    Entity.new
  end
end

class RandomEnemyFactory < EnemyFactory
  def createEnemy
    enemy = Enemy1.new.info
  end
end

class RandomDifficultEnemyFactory < EnemyFactory
  def createEnemy
    random_num = rand(1..2)
    if random_num == 1
      Enemy1.new.name
    else
      Enemy2.new.name
    end
  end
end

class OnlyEnemy3Factory < EnemyFactory
  def createEnemy
    "#{Enemy3.new.info} Only"
    #"Only #{Enemy3.new.name} - #{Enemy3.new.power} - #{Enemy3.new.attack_range}"
  end
end

class Game
  attr_reader :enemy
  attr_writer :nivel
  enemy_factory = EnemyFactory.new
  
  def initialize(nivel)
    @nivel = nivel
  end

  def game_logic
    if @nivel == 1
      enemy = OnlyEnemy3Factory.new.createEnemy
      puts "El enemigo es: #{enemy}"
    end
  end
end

enemy_example = Game.new(1)
puts enemy_example.game_logic
