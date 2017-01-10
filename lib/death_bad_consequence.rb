# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'numeric_bad_consequence'
class DeathBadConsequence < NumericBadConsequence
  def initialize(text, muerte)
    super(text, 0,0,0)
    @death = muerte
  end
  def to_s
    return "#{super.to_s} y mueres, pierdes todos tus tesoros y niveles. "
  end
end
