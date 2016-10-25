# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class BadConsequence
  attr_reader :text
  attr_reader :levels
  attr_reader :nVisibleTreasures
  attr_reader :nHiddenTreasures
  attr_reader :specificVisibleTreasures
  attr_reader :specificHiddenTreasures
  attr_reader :death
#  def initialize
#    @text = "hola"
#    @levels = 9
#    @nHiddenTreasures = 0
#    @nVisibleTreasures = 0
#    @death = true
#  end
  
  private_class_method :new
  def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures, 
        someSpecificVisibleTreasures, someSpecificHiddenTreasures, death)
    @text = aText
    @levels = someLevels
    @nVisibleTreasures = someVisibleTreasures
    @nHiddenTreasures = someHiddenTreasures
    @specificVisibleTreasures = someSpecificVisibleTreasures
    @specificHiddenTreasures = someSpecificHiddenTreasures
    @death = death
  end

  def self.newLevelNumberOfTreasures(aText, someLevels, someVisibleTreasures,
      someHiddenTreasures)
    new(aText, someLevels, someVisibleTreasures, someHiddenTreasures, nil,
      nil, nil)
  end
  
  def self.newLevelSpecificTreasures (aText, someLevels, someSpecificVisibleTreasures,
      someSpecificHiddenTreasures)
    new(aText, someLevels, nil, nil, someSpecificVisibleTreasures, 
      someSpecificHiddenTreasures, nil)
  end
  
  def self.newDeath(aText)
    new(aText, 0, nil, nil, [], [], true)
  end

  def to_s
    puts "Aqui to_S"
    cadena = "Descripcion: #{@text} \n Niveles: #{@levels} \n Numero de tesoros visibles que descarta: #{@nVisibleTreasures} \n Numero te tesoros ocultos que descarta: #{@nHiddenTreasures} \n Muerte: "
    
    if @death
      cadena += "Si"
    else
      cadena += "No"
    end
    
    return cadena
  end
end
