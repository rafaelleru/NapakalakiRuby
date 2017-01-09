# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative "card_dealer.rb"
require_relative "player.rb"

require "singleton"

module Napakalaki
  class Napakalaki
    include Singleton
    
    attr_accessor :currentPlayer
    attr_accessor :players
    attr_accessor :dealer
    attr_accessor :current_monster
    
    def initPlayers(names)
      @dealer = CardDealer.instance
      @players = Array.new      
      names.each do |s|
        @currentPlayer = Player.new(s)
        @players << @currentPlayer
      end
    end
    
    def nextPlayer()
      
      total_players = @players.length
      if(@currentPlayer == nil) then
        next_index = rand(total_players)
      else
        current_player_index = @players.index(@currentPlayer)
        if current_player_index == total_players then
          next_index = 0
        else
          next_index = current_player_index + 1 
        end
      end
      
      next_player = @players.at(next_index)
      @currentPlayer = next_player
      return @currentPlayer
      
    end
    
    def nextTurnIsAllowed()
      
      if @currentPlayer == nil then
        allowed = true
      else
        allowed = @currentPlayer.validState
      end
      
      return allowed
      
    end
    
    def setEnemies()
    end
    
    def developCombat()
      combat = @currentPlayer.combat(@currentMonster)
      dealer.giveMonsterBack(@currentMonster)
      return combat
    end
    
    def discardVisibleTreasures(treasures)
      for i in treasures.size do
        @currentPlayer.discardVisibleTreasure(treasures.get(i))
        @dealer.giveTreasureBack(treasures.get(i))
      end
    end
    
    def discardHiddenTreasures(treasures)
      for i in treasures.size do
        @currentPlayer.discardHiddenTreasure(treasures.get(i))
        @dealer.giveTreasureBack(treasures.get(i))
      end
    end
    
    def makeTreasuresVisible(treasures)
      for i in treasures.size do
        @currentPlayer.makeTreasureVisible(treasures.get(i))
      end
    end
    
    def initGame(names)
      initPlayers(names)
      dealer.initCards
      nextTurn()
    end
    
    def getCurrentPlayer()
      return @current_player
    end
    
    def getCurrentMonster()
      return @current_monster
    end
    
    def nextTurn()
      stateOk = self.nextTurnIsAllowed()
      
      if stateOk
        @currentMonster = dealer.nextMonster()
        @currentPlayer = self.nextPlayer()
        
        dead = @currentPlayer.dead
        
        if dead
          @currentPlayer.initTreasures()
        end
      end
      
      return stateOk
    end
    
    def endOfGame(result)
      if result == WINGAME
        return true
      else
        return false
      end
    end
    
  end
end
