# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Player
  
  attr_reader :name
  attr_reader :level
  attr_reader :dead
  attr_reader :canISteal
  attr_reader :enemy
  attr_accesor :pendingBadConsequence
  attr_reader :hiddenTreasures
  attr_reader :visibleTreasures
  MAXLEVEL = 10
  
  def initialize(n)
    @name = n
  end
  
  def bringToLife()
    @dead = true
  end
  
  def incrementLevels(l)
    if level+l < MAXLEVEL
      @level = @MAXLEVEL
    else
      @level += l
    end
  end
  
  def decrementLevels(l)
    if @level-l > 0
      incrementLevels(-l)
    else
      @level = 0
    end
  end 
  
  def applyPrize(monster)
    
  end
  
  def canMakeTreasureVisible(treasure)
    
    result = false
    
    case treasure.type
    when ONEHAND
      if is_treasure_kind_in_use(BOTHHANDS) then
        result =false
      else
        i=0
        @visibleTreasures.each do |tv|
          if tv.type == ONEHAND then
            i += 1
          end
        end
        
        if i == 2 then
          result = false
        else
          result = true
        end
      end
    else
      result = !is_treasure_kind_in_use(treasure.type)
    end
    
    return result
  end
  
  def howManyVisibleTreasures(tkind)
    i = 0
    @visbleTreasures.each { |t| 
      if t.kind == t
        ++i
      end
    }
    
    return i
  end
  
  def howManyHiddenTreasures(tkind)
     i = 0
    @hiddenTreasures.each { |t| 
      if t.kind == t
        ++i
      end
    }
    
    return i
  end
  
  def dieIfNoTreasures()
    if @visibleTreasures.length < 0 and @hiddenTreasures.length < 0
      @dead = true
    end
  end
  
  def isDead()
    return @dead
  end
  
  def combat(monster)
    
  end
  
  def makeTreasureVisble(treasure)
    
  end
  
  def discarVisibleTreasure(treasure)
    
  end
  
  def discarHiddenTreasure(treasure)
   
  end
  
  def validState()
    if @pendingBadConsequence.isEmpty() and @hiddenTreasures.length < 4
      return true
    else return false
    end
  end
  
  def initTreasures()
    
  end
  
  def stealTreasure()
    
  end
  
  def setEnemy(player)
    @enemy = player
  end
  
  def giveMeATreasure()
    i = rand(@hiddenTreasures.length)
    return @hiddenTreasures.get(i)
    
  end
  
  def canISteal()
    return @canIsteal
  end
  
  def canYouGiveMeATreasure()
    if @visibleTreasures.length > 0 or @hiddenTreasures.length > 0
      return true
    else return false
    end
  end
  
  def haveStolen()
    can@canIsteal = false
  end
  
  def discardAllTreasures()
    
  end
  
end