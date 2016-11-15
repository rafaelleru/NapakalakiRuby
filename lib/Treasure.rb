# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Napakalaki
  
  class Treasure
    
    attr_reader :name
    attr_reader :bonus
    attr_reader :type
    
    def Treasure(n, b, t)
      @name = n
      @bonus = b
      @type = t
    end
    
    def to_s
      return " Nombre: #{@name} Bonus: #{@bonus} Tipo: #{@type}"
    end
    
  end
end
