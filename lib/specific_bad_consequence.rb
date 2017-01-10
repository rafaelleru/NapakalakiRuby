# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'BadConsequence.rb'
require_relative 'Monster.rb'
require_relative 'Prize.rb'
require_relative 'TreasureKind.rb'
class SpecificBadConsequence < BadConsequence
  attr_reader :specificVisibleTreasures, :specificHiddenTreasures
  
  def initialize(text, nivel, someHidden, someVisible)
    super(text, nivel)
    @specificVisibleTreasures = someVisible
    @specificHiddenTreasures = someHidden
  end
  
  def isEmpty()
    return (@specificVisibleTreasures.size == 0 && @specificHiddenTreasures.size == 0)
  end
  
  def substractVisibleTreasures (t)
    if (@specificVisibleTreasures.include? t)
      @specificVisibleTreasures.delete(t)
    end
  end
  
  def substractHiddenTreasures(t)
    if (@specificHiddenTreasures.include? t)
      @specificHiddenTreasures.delete(t)
    end
  end
  
    def adjustToFitTreasureLists(v, h)
      sv = Array.new
      sh = Array.new
      visible = Array.new(v) 
      oculto = Array.new(h)
      if(@specificVisibleTreasures != nil)
        if(@specificVisibleTreasures.empty? != true)
          visible.each { |i|  
          if(@specificVisibleTreasures.include? i )
            sv.push(i.type)
            visible.delete(i)
          end
          }
        end
      end
      if(@specificHiddenTreasures != nil)
        if(@specificHiddenTreasures.empty? != true)
          oculto.each { |o|  
            if(@specificHiddenTreasures.include? o)
              sh.push(o.type)
              oculto.delete(o)
            end
          }
        end
      end
      bc = SpecificBadConsequence.new(@texto, 0, sv, sh)
      return bc
    end
    
    def to_s
      th = Array.new()
      tv = Array.new()
      if(@specificHiddenTreasures != nil)
        @specificHiddenTreasures.each { |h|  
          th<<("Tipo de tesoros ocultos a perder: #{h}" )
        }
      else
        th<< ("no pierdes ocultos")
      end
      if (@specificVisibleTreasures != nil)
        @specificVisibleTreasures.each { |v|
          tv<<("Tipo de tesoros visibles a perder: #{v}" )
        }
      else
        tv<<("no pierdes visibles")
      end
      
      return "#{super.to_s} #{th} #{tv}"
    end

end
