# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Napakalaki
  require "singleton"

  class CardDealer
  
    include singleton
  
    attr_reader :useMonsters
    attr_reader :unusedMonsters
    attr_reader :usedTreasures
    attr_reader :unusedTreasures
  
    def initTreasureCardDeck
      
    
      @unusedTreasures = Array.new
      @usedTreasures = Array.new 
    
      #Creamos los tesoros
      
      @unusedTreasures << Treasure.new("¡Sí mi amo!", 4, HELMET)
      @unusedTreasures << Treasure.new("Botas de investigación", 3, SHOES)
      @unusedTreasures << Treasure.new("Capucha de Cthulhu", 3, HELMET)
      @unusedTreasures << Treasure.new("A prueba de babas", 2, ARMOR)
      @unusedTreasures << Treasure.new("Botas de lluvia ácida", 1, BOTHHANDS)
      @unusedTreasures << Treasure.new("Casco minero", 2, HELMET)
      @unusedTreasures << Treasure.new("Ametralladora ACME", 600, 4, 8, BOTHHANDS)
      @unusedTreasures << Treasure.new("Camiseta de la ETSIIT", 1, ARMOR)
      @unusedTreasures << Treasure.new("Clavo de rail ferroviario", 3, ONEHAND)
      @unusedTreasures << Treasure.new("Cuchillo de sushi arcano", 2, ONEHAND)
      @unusedTreasures << Treasure.new("Fez alópodo", 3, HELMET)
      @unusedTreasures << Treasure.new("Hacha prehistórica", 2, ONEHAND)
      @unusedTreasures << Treasure.new("El aparato del Pr. Tesla", 4, ARMOR)
      @unusedTreasures << Treasure.new("Gaita", 4, BOTHHANDS)
      @unusedTreasures << Treasure.new("Insecticida", 2, ONEHAND)
      @unusedTreasures << Treasure.new("Escopeta de 3 cañones", 4, BOTHHANDS)
      @unusedTreasures << Treasure.new("Garabato Mistico", 2, ONEHAND)
      @unusedTreasures << Treasure.new("La rebeca metálica", 2, ARMOR)
      @unusedTreasures << Treasure.new("Lanzallamas", 4, BOTHHANDS)
      @unusedTreasures << Treasure.new("Necro-comicón", 1, ONEHAND)
      @unusedTreasures << Treasure.new("Necronomicón", 5, BOTHHANDS)
      @unusedTreasures << Treasure.new("Linterna a 2 manos", 3, BOTHHANDS)
      @unusedTreasures << Treasure.new("Necro-gnomicón", 2, ONEHAND)
      @unusedTreasures << Treasure.new("Necrotelecom", 2, HELMET)
      @unusedTreasures << Treasure.new("Mazo de los antiguos", 3, ONEHAND)
      @unusedTreasures << Treasure.new("Necro-playboycon", 3, ONEHAND)
      @unusedTreasures << Treasure.new("Porra preternatural", 2, ONEHAND)
      @unusedTreasures << Treasure.new("Shogulador", 1, BOTHHANDS)
      @unusedTreasures << Treasure.new("Varita de atizamiento", 3, ONEHAND)
      @unusedTreasures << Treasure.new("Tentácula de pega", 2, HELMET)
      @unusedTreasures << Treasure.new("Zapato deja-amigos", 1, SHOES)

    end
  
    def initMonsterCardDeck
    
      @unusedMonsters = Array.new
      @usedMonsters = Array.new
    
      # 3 byakhees de bonanza
      price1 = Prize.new(2, 1)
      badConsequence1 = BadConsequence.newLevelSpecificTreasures('Pierdes tu armadura visible y otra oculta', 0, [Napakalaki::ARMOR], [Napakalaki::ARMOR])
      @unusedMonsters << Monster.new('3 byakhees de bonanza', 8, badConsequence1, price1)
    
      # Tenochtitlan
      price2 = Prize.new(1, 1)
      badConsequence2 = BadConsequence.newLevelSpecificTreasures('Embobados con el primigenio te descartas de tu casco visible.', 0, [] , [Napakalaki::ARMOR])
      @unusedMonsters << Monster.new('Tenochtitlan', 2, badConsequence2, price2)
    
      # El sopor de Dunwich
      price3 = Prize.new(1, 1)
      badConsequence3 = BadConsequence.newLevelSpecificTreasures('El primordial bostezo contagioso, pierdes el calzado visible', 0, [Napakalaki::SHOES], [])
      @unusedMonsters << Monster.new('El sopor de Dunwich', 2, badConsequence3, price3)
    
      # Demonios de magaluf
      prize4 = Prize.new(4, 1)
      bc4 = BadConsequence.newLevelSpecificTreasures("Te atrapan para llevarte de fiesta y te dejan caer en mitad de vuelo. Descarta 1 mano visible y 1 mano oculta.", 0, [Napakalaki::ONEHAND], [Napakalaki::ONEHAND])
      @unusedMonsters << Monster.new('Demonios de magaluf', 2, bc4, prize4)
    
      # El gorron en el umbral
      p5 = Prize.new(3, 1)
      bc5 = BadConsequence.newLevelNumberOfTreasures("pierdes todos tus tesoros visibles", 0, 10, 0)
      @unusedMonsters << Monster.new('El gorron del umbral', 13, bc5, p5)
    
      # H.P munchcraft
      p6 = Prize.new(2, 1)
      bc6 = BadConsequence.newLevelSpecificTreasures("Pierdes la armadura visible", 0, [Napakalaki::ARMOR], [])
      @unusedMonsters << Monster.new('H.P. Munchcraft', 6, bc6, p6)
    
      # Necrofago
      p7 = Prize.new(1, 1)
      bc7 = BadConsequence.newLevelSpecificTreasures("Sientes bichos bajo la ropa. Descarta la armadura visible", 0, [Napakalaki::ARMOR], [])
      @unusedMonsters << Monster.new('Necrofago', 13, bc7, p7)
    
      # El rey rosado
      price = Prize.new(4,2)
      badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes 5 niveles y 3 tesoros visibles',5 , 3, 0)
      @unusedMonsters << Monster.new('El rey rosado',13,badConsequence, price)
    
      # Flecher
      p8 = Prize.new(1, 1)
      bc8 = BadConsequence.newLevelNumberOfTreasures("Toses los pulmones y pierdes 2 niveles", 2, 0, 0)
      @unusedMonsters << Monster.new('Flecher', 2, bc8, p8)
    
      # los hondos
      p9 = Prize.new(2, 1)
      bc9 = BadConsequence.newDeath('Estos monstruos resultab bastante superficiales y te aburren mortalmente. Estas muerto')
      @unusedMonsters << Monster.new('los hondos', 8, bc9, p9)
    
      # semillas cthulhu
      p10 = Prize.new(2, 1)
      bc10 = BadConsequence.newLevelSpecificTreasures('Te intentas escaquear. Pierdes la mano visible', 0, [Napakalaki::ONEHAND], [])
      @unusedMonsters << Monster.new('Semillas Cthulhu', 4, bc10, p10)
    
      # Dameargo
      p11 = Prize.new(2, 1)
      bc11 = BadConsequence.newLevelSpecificTreasures('Te intentas escaquear. Pierdes una mano visible', 0, [Napakalaki::ONEHAND], [])
      @unusedMonsters << Monster.new('Dameargo', 1, bc11, p11)
    
      # Pollipolipo volante
      p12 = Prize.new(2, 1)
      bc12 = BadConsequence.newLevelNumberOfTreasures('Da mucho asquito. Pierdes 3 niveles', 3, 0, 0)
      @unusedMonsters << Monster.new('Pollipolipo volante', 3, bc12, p12)
    
      # Yskhtihyssg-Goth
      p13 = Prize.new(3, 1)
      bc13 = BadConsequence.newDeath('No le hace gracia que pronuncien mal su nombre. Estas muerto')
      @unusedMonsters << Monster.new('Yskhtihyssg-Goth', 14, bc13, p13)
    
      # Familia Feliz
      p14 = Prize.new(3, 1)
      bc14 = BadConsequence.newDeath('La familia te atrapa. Estas muerto')
      @unusedMonsters << Monster.new('Familia feliz', 1, bc14, p14)
    
      # Roboggoth
      p15 = Prize.new(2, 1)
      bc15 = BadConsequence.newLevelSpecificTreasures('La quinta directiva primitiva te obliga a perder 2 niveles y un tesorode 2 manos visible#',2,[Napakalaki::BOTHHANDS],[])
      @unusedMonsters << Monster.new('Robbogoth', 8, bc15, p15)
    
      # El Espía sordo
      p16 = Prize.new(1, 1)
      bc16 = BadConsequence.newLevelSpecificTreasures('Te asusta en la noche.Pierdes un casco visible#',0,[Napakalaki::HELMET],[])
      @unusedMonsters << Monster.new('El espia sordo', 5, bc16, p16)
    
      #Tongue
      p17 = Prize.new(2, 1)
      bc17 = BadConsequence.newLevelNumberOfTreasures('Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles.#', 2, 5, 0)
      @unusedMonsters << Monster.new('Tongue', 19, bc17, p17)
    
      #Bicéfalo
      p18 = Prize.new(2, 1)
      bc18 = BadConsequence.newLevelNumberOfTreasures('Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos.#', 3, 10, 0)
      @unusedMonsters << Monster.new('Bicefalo', 21, bc18, p18)
    
    end
    
    def shuffleTreasures
      @unusedTreasures = @unusedTreasures.shuffle
    end
    
    def shuffleMonsters
      @unusedMonsters = @unusedMonsters.shuffle
    end
    
    #def nextTreasure end
    #def nextMonster end
    
    def giveTreasureBack(t)
      @usedTreasures.add(t)
    end
    
    def giveMonsterBack(m)
      @usedMonsters.add(m)
    end
    
    #def initCards end
    
  end
end

