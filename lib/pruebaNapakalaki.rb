# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'bad_consequence.rb'
require_relative "monster.rb"
require_relative "prize.rb"

class PruebaNapakalaki
  attr_reader :bc
  def saluda()
    @monster = Monster.new("eaf",14,nil,nil)
    @bc = BadConsequence.new
    #puts @bc.to_s
    puts @monster.to_s
  end
puts "hola"
p = PruebaNapakalaki.new
p.saluda()
end