# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Prize
  attr_reader :treasures
  attr_reader :level
  def initialize(t, l)
    @treasures = t
    @level = l
  end
  
  def to_s
    "Tesoros: #{@treasures} \n Nivel: #{@level}"
  end
end
