# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module Napakalaki
require "singleton"
class Dice
  
  import Singleton
  
  def next_number()
    return 1 + rand(6)
  end
end
end