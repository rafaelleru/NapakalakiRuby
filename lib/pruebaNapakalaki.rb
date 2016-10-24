# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'bad_consequence.rb'
require_relative 'prize.rb'
require_relative 'TreasureKind.rb'

class PruebaNapakalaki
  attr_reader :bc
  @@monsters = Array.new
  def saluda()
    @bc = BadConsequence.newLevelNumberOfTreasures('Pierdes 5 niveles y 3 tesoros visibles',5 , 3, 0)
    puts @bc.to_s
  end
  
  def self.imprimir(monst, msg)
    puts msg
    puts monst
  end
  
  def self.monstersMoreLevelThan10()
   @@monsters.select { |m| m.Monster.combatLevel >= 10 }
  end
  
  def self.monstersLoseLevels()
    @@monsters.select { |m| 
      m.bc.someLevels > 0 and not m.BadConsequence.nVisibleTreasures and not 
      m.BadConsequence.nHiddenTreasures
      }
  end
  
  def self.monsterWinLevels()
    @@monsters.select { |m| m.Prize.level > 1 }
  end
  
  def self.monsterLoseTreasures(tipo)
    @@monsters.select { |m|
      m.BadConsequence.specificVisibleTreasures(tipo) or
      m.BadConsequence.specificHiddenTreasures(tipo)
    }
  end
  
  def createMonsters
    # 3 byakhees de bonanza
    price1 = Prize.new(2, 1)
    badConsequence1 = BadConsequence.newLevelSpecificTreasures('Pierdes tu armadura visible y otra oculta', 0, armor, armor)
    @@monsters << Monster.new('3 byakhees de bonanza', 8, badConsequence1, prize1)
#    
#    # Tenochtitlan
#    price2 = Prize.new(1, 1)
#    badConsequence2 = BadConsequence.newLevelSpecificTreasures('Embobados con el primigenio te descartas de tu casco visible.', 0, nil , TreasureKind.armor)
#    @@monsters << Monster.new('Tenochtitlan', 2, badConsequence2, prize2)
#    
#    # El sopor de Dunwich
#    price3 = Prize.new(1, 1)
#    badConsequence3 = BadConsequence.newLevelSpecificTreasures('El primordial bostezo contagioso, pierdes el calzado visible', 0, TreasureKind.shoe, nil)
#    @@monsters << Monster.new('El sopor de Dunwich', 2, badConsequence3, prize3)
#    
#    # Demonios de magaluf
#    prize4 = Prize.new(4, 1)
#    bc4 = BadConsequence.newLevelSpecificTreasures("Te atrapan para llevarte de fiesta y te dejan caer en mitad de vuelo. Descarta 1 mano visible y 1 mano oculta.", 0, TreasureKind.hand, TreasureKind.hand)
#    @@monsters << Monster.new('Demonios de magaluf', 2, bc4, prize4)
#    
#    # El gorron en el umbral
#    p5 = Prize.new(3, 1)
#    bc5 = BadConsquence.newLevelNumberOfTreasures("pierdes todos tus tesoros visibles", 0, 10, 0)
#    @@monsters << Monster.new('El gorron del umbral', 13, bc5, p5)
#    
#    # H.P munchcraft
#    p6 = Prize.new(2, 1)
#    bc6 = BadConsequence.newLevelSpecificTreasures("Pierdes la armadura visible", 0, TreasureKind.armor, nil)
#    @@monsters << Monster.new('H.P. Munchcraft', 6, bc6, p6)
#    
#    # Necrofago
#    p7 = Prize.new(1, 1)
#    bc7 = BadConsequence.newLevelSpecificTreasures("Sientes bichos bajo la ropa. Descarta la armadura visible", 0, TreasureKind.armor, nil)
#    @@monsters << Monster.new('Necrofago', 13, bc7, p7)
#    
#    # El rey rosado
#    price = Prize.new(4,2)
#    badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes 5 niveles y 3 tesoros visibles',5 , 3, 0)
#    @@monsters << Monster.new('El rey rosado',13,badConsequence, prize)
#    
#    # Flecher
#    p8 = Prize.new(1, 1)
#    bc8 = BadConsequence.newLevelNumberOfTreasures("Toses los pulmones y pierdes 2 niveles", 2, 0, 0)
#    @@monsters << Monster.new('Flecher', 2, bc8, p8)
#    
#    # los hondos
#    p9 = Prize.new(2, 1)
#    bc9 = BadConsequence.newDeath('Estos monstruos resultab bastante superficiales y te aburren mortalmente. Estas muerto')
#    @@monsters << Monster.new('los hondos', 8, bc9, p9)
#    
#    # semillas cthulhu
#    p10 = Prize.new(2, 1)
#    bc10 = BadConsequence.newLevelSpecificTreasures('Te intentas escaquear. Pierdes la mano visible', 0, TreasureKind.hand, nil)
#    @@monsters << Monster.new('Semillas Cthulhu', 4, bc10, p10)
#    
#    # Dameargo
#    p11 = Prize.new(2, 1)
#    bc11 = BadConsequence.newLevelSpecificTreasures('Te intentas escaquear. Pierdes una mano visible', 0, TreasureKind.hand, nil)
#    @@monsters << Monster.new('Dameargo', 1, bc11, p11)
#    
#    # Pollipolipo volante
#    p12 = Prize.new(2, 1)
#    bc12 = BadConsequence.newLevelNumberOfTreasures('Da mucho asquito. Pierdes 3 niveles', 3, 0, 0)
#    @@monsters << Monster.new('Pollipolipo volante', 3, bc12, p12)
#    
#    # Yskhtihyssg-Goth
#    p13 = Prize.new(3, 1)
#    bc13 = BadConsequence.newDeath('No le hace gracia que pronuncien mal su nombre. Estas muerto')
#    @@monsters << Monster.new('Yskhtihyssg-Goth', 14, bc13, p13)
#    
#    # Familia Feliz
#    p14 = Prize.new(3, 1)
#    bc14 = BadConsequence.newDeath('La familia te atrapa. Estas muerto')
#    @@monsters << Monster.new('Familia feliz', 1, bc14, p14)
#    
#    # Roboggoth
#    p15 = Prize.new(2, 1)
#    bc15 = BadConsequence.newLevelSpecificTreasures('La quinta directiva primitiva te
 #    obliga a perder 2 niveles y un tesorode 2 manos visible#',2,TreasureKind.BOTHHANDS,0)
#    @@monsters << Monster.new('Robbogoth', 8, bc15, p15)
#    
#    # El Espía sordo
#    p16 = Prize.new(1, 1)
#    bc16 = BadConsequence.newLevelSpecificTreasures('Te asusta en la noche.Pierdes un 
     casco visible#',0,TreasureKind.HELMET,0)
#    @@monsters << Monster.new('El espia sordo', 5, bc16, p16)
#    
#    #Tongue
#    p17 = Prize.new(2, 1)
#    bc17 = BadConsequence.newLevelNumberOfTreasures('Menudo susto te llevas. Pierdes 2 niveles
    #  y 5 tesoros visibles.#', 2, 5, 0)
#    @@monsters << Monster.new('Tongue', 19, bc17, p17)
#    
#    #Bicéfalo
#    p18 = Prize.new(2, 1)
#    bc18 = BadConsequence.newLevelNumberOfTreasures('Te faltan manos para tanta cabeza. 
     # Pierdes 3 niveles y tus tesoros visibles de las manos.#', 3, 10, 0)
#    @@monsters << Monster.new('Bicefalo', 21, bc18, p18)
    
  end
  
  def monstersWithLevel10
    ret = Array.new
    monsters.each do |m|
      if m.bc.level > 10
        ret.push(m)
      end
    end
    
    return ret
  end
  
  def monsterBcOnlyLevels
    ret = Array.new
    monsters.each do |m|
      if m.bc.specificHiddenTreasures == nil and m.bc.specificVisibleTreasures == nil and not m.bc.death
        ret.push(m)
      end
    end
    
    return ret
  end
puts "hola"
p = PruebaNapakalaki.new
p.createMonsters
imprimir(self.monsterWinLevels(),"Monstruos que dan mas de 1 nivel")
#p.saluda()
end