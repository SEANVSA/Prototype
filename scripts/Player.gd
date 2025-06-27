class_name Player extends Chara

var crit_chance: float = 0.0
var crit_multiplier: float = 0.0

func _init(_name: String = "Player",  _damage: float = 1.0, _crit_chance: float = 0.1, _crit_multiplier: float = 2.0):
	super(_name,_damage)
	crit_chance = _crit_chance
	crit_multiplier = _crit_multiplier
	
func tap_damage() -> float:
	var damage_dealt = damage
	if randf() < crit_chance:
		damage_dealt *= crit_multiplier
	return	damage_dealt
func upgrade_tap_damage(amount: float):
	damage += amount
func upgrade_crit_chance(amount: float):
	crit_chance += amount
func upgrade_crit_multiplier(amount: float):
	crit_multiplier += amount
