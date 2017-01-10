# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module Napakalaki

require_relative "prize.rb"

class Monster
  attr_reader :name
  attr_reader :combatLevel
  attr_reader :bc
  attr_reader :prize
  attr_reader :levelChangeAgainstCultistPlayer
  
  def initialize(name, combatLevel, bc, prize)
    @name = name
    @combatLevel = combatLevel
    @bc = bc
    @prize = prize
  end
  
  def Monster(n, l, badConsequence, p, lC = 0)
    @name = n
    @combatLevel = l
    @bc = badConsequence
    @prize = p
    @levelChangeAgainstCultistPlayer = lC
  end
  
  def to_s
    "Nombre: #{@name} \n Nivel de combate: #{@combatLevel} \n Mal rollo: #{@bc.to_s} \n Buen rollo: #{@prize.to_s}"
  end
  
  def getCombatLevelAgainstcultistPlayer()
    return @levelChangeAgainstCultistPlayer + @combatLevel
  end
  
end
end