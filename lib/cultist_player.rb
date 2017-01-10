# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'player'

module Napakalaki
  
  class CultistPlayer < Player
    attr_accessor :myCultistCard
    @@totalCultistPlayers = 0
    
    def initialize(player, cultist)
      super(player.name)
      copyConstructor(player)
      @myCultistCard = cultist
      @@totalCultistPlayers += 1
    end
    
    def getOponentLevel(monster)
      return monster.combatLevel
    end
    
    def shouldConvert()
      return false
    end
    
  end
  
end
