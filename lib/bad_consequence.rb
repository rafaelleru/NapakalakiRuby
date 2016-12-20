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
    new(aText, someLevels, someVisibleTreasures, someHiddenTreasures, [],
      [], nil)
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
  
  def isEmpty
    if @nVisibleTreasures == nil and @nHiddenTreasures == nil and 
        @specificVisibleTreasures == nil and @specificHiddenTreasures == nil
      return true
    else
      return false
    end
  end
  
  def substractVisibleTreasure(someSpecificVisibleTreasure)
    @specificVisibleTrasure.delete(someSpecificVisibleTreasure)
  end
  def substractHiddenTreasure(someSpecificHiddenTreasure)
    @specificHiddenTreasure.delete(someSpecificHiddenTreasure)
  end
  
  def adjustToFitTreausreLists(v, h)
      tvisible=v.size
      thidden=h.size
      sv=Array.new
      sh=Array.new
      
      if (@someVisibleTreasures>0 || @someHiddenTreasures>0)
        if (@someVisibleTreasures<=tvisible)
          @someVisibleTreasures=tvisible-@someVisibleTreasures
        end
        if (@someHiddenTreasures<=thidden)
          @someHiddenTreasures=thidden-@someHiddenTreasures
        end
        ntes = BadConsequence.new("",0,@someVisibleTreasures,@someHiddenTreasures)
        return ntes
      else
        if (@someSpecificVisibleTreasures != nil)
          if (!(@someSpecificVisibleTreasures.empty?))
            for i in v.size do
              if (@someSpecificVisibleTreasures.include?(v.get(i)))
                sv<<(v.get(i).type)
                v.delete(v.get(i))
              end
            end
          end
        end
        if (@someSpecificHiddenTreasures != nil)
          if (!(@someSpecificHiddenTreasures.empty?))
            for j in h.size do
              if (@someSpecificHiddenTreasures.include?(h.get(j)))
                sh<<(h.get(j).type)
                h.delete(h.get(j))
              end
            end
          end
        end
          stes = BadConsequence.new("",0,sv,sh)
      end
      return stes
  end


end
