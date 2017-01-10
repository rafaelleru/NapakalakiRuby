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
    
    def getCombatLevel()
      cL = super.level
      cL = cL + 0,7*cL + @myCultistCard.levels*@@totalCultistPlayers
      return cL
    end
    
    def getOponentLevel(monster)
      return monster.combatLevel
    end
    
    def shouldConvert()
      return false
    end
    
    def giveMeATreasure()
      return self.visibleTreasures.at(1 + rand(super.visibleTreasures.size))
    end
    
    def canYouGiveMeATreasure()
      return self.enemy.nVisibleTreasures.size>0
    end
    
  end
  
end
