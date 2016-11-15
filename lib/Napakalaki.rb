# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require "singleton"

class Napakalaki
  include Singleton

  attr_reader :currentPlayer
  attr_reader :players
  attr_reader :dealer
  attr_reader :current_monster
  
  def initPlayers(names)
  end
  
  def nextPlayer()
    
  end
  
  def nextTurnIsAllowed()
    
  end
  
  def setEnemies()
  end
  
  def developCombat()
    
  end
  
  def discardVisibleTreasures(treasures)
    
  end
  
  def discardHiddenTreasures(treasures)
    
  end
  
  def makeTreasureVisible()
    
  end
  
  def initGame()
    
  end
  
  def getCurrentPlayer()
    
  end
  
  def getCurrentMonster()
    
  end
  
  def nextTurn()
    
  end
  
  def endOfGame()
    
  end
end