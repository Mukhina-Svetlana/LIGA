enum AttakStyle: String {
    case attack = "attack"
    case melee = "melee attak"
    case longRange = "long range attak"
}

protocol Statistics {
    init(armor: Float, attackPower: Float, strength: Float, agility: Float, intelligence: Float, hitPoints: Float, mana: Float)

    func updateStatistics(armor: Float, attackPower: Float, strength: Float, agility: Float, intelligence: Float, hitPoints: Float, mana: Float)
}

protocol Move {
    func move()
    func stop()
}

protocol Attack {
    func attack()
}

protocol Ultimate {
    func ultimate()
}

extension Move {
    func move() {
        print("move")
    }

    func stop() {
        print("stop")
    }
}


protocol AttackArchmage: Attack {
}

extension AttackArchmage {
    func attack() {
        print(AttakStyle.attack.rawValue)
        print(AttakStyle.longRange.rawValue)
    }
}

protocol AttackMountainKing: Attack {
}

extension AttackMountainKing {
    func attack() {
        print(AttakStyle.attack.rawValue)
        print(AttakStyle.melee.rawValue)
        
    }
}
protocol UlimateArchmage: Ultimate {
}

extension UlimateArchmage {
    func ultimate(){
        print("Avatar")
    }
}

protocol UltimateMountainKing: Ultimate {
}

extension UltimateMountainKing {
    func ultimate() {
        print("Mass Teleport")
    }
}

class Statistic: Statistics {
    
    private(set) var armor: Float?
    private(set) var attackPower: Float?
    private(set) var strength: Float?
    private(set) var agility: Float?
    private(set) var intelligence: Float?
    private(set) var hitPoints: Float?
    private(set) var mana: Float?
    
    required init(armor: Float, attackPower: Float, strength: Float, agility: Float, intelligence: Float, hitPoints: Float, mana: Float) {
        self.armor = armor
        self.attackPower = attackPower
        self.strength = strength
        self.agility = agility
        self.intelligence = intelligence
        self.hitPoints = hitPoints
        self.mana = mana
    }
    
    func updateStatistics(armor: Float, attackPower: Float, strength: Float, agility: Float, intelligence: Float, hitPoints: Float, mana: Float) {
        self.armor = armor
        self.attackPower = attackPower
        self.strength = strength
        self.agility = agility
        self.intelligence = intelligence
        self.hitPoints = hitPoints
        self.mana = mana
    }
}

class Archmage: Statistic, Move, AttackArchmage, UlimateArchmage {
    
    func info() {
        print("\(String(describing: self))")
    }
}

class MountainKing: Statistic, Move, AttackMountainKing, UltimateMountainKing {
    func info() {
        print("\(String(describing: self))")
    }
}

let mount = MountainKing(armor: 4, attackPower: 2, strength: 7, agility: 9, intelligence: 10, hitPoints: 3, mana: 100)
mount.mana
mount.attack()
mount.ultimate()
mount.move()
mount.stop()
mount.info()
mount.updateStatistics(armor: 2, attackPower: 10, strength: 8, agility: 6, intelligence: 10, hitPoints: 6, mana: 500)
mount.attackPower
