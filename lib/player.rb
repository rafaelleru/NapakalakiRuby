# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module Napakalaki
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
  
  def applyBadConsequence(monster)
    bc = monster.bc
    nLevels = bc.levels
    self.decrementLevels(nLevels)
    
    pendingBadConsequence = bc.adjustToFitTreasureList(self.nVisibleTreasures, self.nHiddenTreasures)
  end
  
  def applyPrize(monster)
    nLevels = monster.combatLevel
    self.incrementLevels(nLevels)
    
    nTreasures = monster.nTreasures
    if(nTreasures > 4)
      dealer = CardDealer.get_instance
      
      n = dealer.nextNumber
      i = 0
      while(i < n)
        t = dealer.nextTreasure
        @hiddenTreasures << t
      end
    end
    
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
    
    monsterLevel = monster.combatLevel
    if(@canISteal == false)
      dice  =Dice.get_instance
      
      n = dice.nextNumber()
      if(n < 3)
        monsterLevel += @enemy.level
      end
      
      if(monsterLevel < myLevel)
        self.applyPrize(monster)
        if(@level == 10)
          return CombatResul.WINGAME
        else
          return CombatResult.WIN
        end
      else
        self.applyBadConsequence(monster)
        return CombatResult.LOSE        
     end
    
    end
  end
  
  def makeTreasureVisble(treasure)
    canI = canMakeTreasureVisible(t)
    if(canI==true)
      @visibleTreasures<<(t)
      @hiddenTreasures.delete(t)
    end
  end
  
  def discarVisibleTreasure(treasure)
    @visibleTreasures.delete(t)
    if(!(@pendingBadConsequence.isEmpty))
      @pendingBadConsequence.substractVisibleTreasure(t)
    end
    dieIfNoTreasures
  end
  
  def discarHiddenTreasure(treasure)
    @hiddenTreasures.delete(t)
    if(!(@pendingBadConsequence.isEmpty))
      @pendingBadConsequence.substractHiddenTreasure(t)
    end
    dieIfNoTreasures 
  end
  
  def validState()
    if @pendingBadConsequence.isEmpty() and @hiddenTreasures.length < 4
      return true
    else return false
    end
  end
  
  def initTreasures()
    dealer = CardDealer.get_instance
    dice = Dice.get_instance
    
    self.bringToLife()
    t = dealer.nextTreasure
    @hiddenTreasures << t
    
    n = dice.nextNumber
    
    if(n > 1)
      t = dealer.nextTreasure
      @hiddenTreasures << t
    end
    
    if(n == 6)
      t = dealer.nextTreasure
      @hiddenTreasures << t
    end
    
  end
  
  def stealTreasure()
    canI=@canISteal
    treasure=nil
    if(canI==true)
      canYou=@enemy.canYouGiveMeATreasure
      if(canYou==true)
        treasure=@enemy.giveMeATreasure
        @hiddenTreasures<<(treasure)
        haveStolen
      end
    end
    return treasure
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
    @visibleTreasures.each do|t|
      self.discardVisibleTreasure(t)
    end
    
    @hiddenTreasures.each do |t|
      self.discardHiddenTreasures(t)
    end
    
  end
  
end
end
