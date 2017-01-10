# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'BadConsequence.rb'
require_relative 'Monster.rb'
require_relative 'Prize.rb'
require_relative 'TreasureKind.rb'
class NumericBadConsequence < BadConsequence
  attr_reader :nHiddenTreasures, :nVisibleTreasures
  
  def initialize(text, nivel, nVisible, nHidden)
    super(text, nivel)
    @nVisibleTreasures = nVisible
    @nHiddenTreasures = nHidden
    
  end
  def substractVisibleTreasures(t)
    
    if @nVisibleTreasures
      @nVisibleTreasures -= 1
    end
  end
  
  def substractHiddenTreasures(t)
    
    if @nHiddenTreasures
      @nHiddenTreasures -= 1
    end
  end
  
  def adjustToFitTreasureLists(v, h)
    
    if(@nVisibleTreasures > v.size)
      visibles = v.size
    else
      visibles = @nVisibleTreasures
    end
      
    if(@nHiddenTreasures > h.size)
      ocultos = h.size
    else
      ocultos = @nHiddenTreasures
    end
    
    bc = NumericBadConsequence.new(@texto, 0, visibles, ocultos)
 
    return bc
    
  end
  
  def to_s
    if(@nVisibleTreasures > 0)
      p = "\n Numero de tesoros visibles perdidos #{@nVisibleTreasures}"
    else
      p = "\n Numero de tesoros visibles perdidos #{@nHiddenTreasures}"
    end
    return p
  end
end
