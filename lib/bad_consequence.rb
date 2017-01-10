# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module Napakalaki
class BadConsequence  
  
  attr_accessor  :texto, :levels, :death
  attr_reader :MAXTREASURES
  @@MAXTREASURES=10

  def initialize(text, nivel)
    @texto = text
    @levels = nivel
    @death = false
    
  end
  
  def max
    max = @@MAXTREASURES
    return max
  end
  def isEmpty()
    return (@death == false && @levels == 0)
  end
  
  def substractVisibleTreasures(t)
    
    raise NotImplementedError.new
  end
  
  def substractHiddenTreasures(t)
    
    raise NotImplementedError.new
  end
  
  def adjustToFitTreasureLists(v, h)
    raise NotImplementedError.new
    
  end
  
  def to_s
      return "\n Nombre: #{@texto} \n Nivel: #{@levels}" 
  end
 
  
end
end