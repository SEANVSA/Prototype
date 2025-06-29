class_name Player extends Chara

var tap_damage_level: int = 1
var crit_chance_level: int = 1
var crit_multiplier_level: int = 1
var crit_chance: float = 0.0
var crit_multiplier: float = 0.0

func _init(_name: String = "Player",  _damage: float = 1.0, _crit_chance: float = 0.1, _crit_multiplier: float = 2.0, _tap_damage_level:int = 1):
	super(_name,_damage)
	crit_chance = _crit_chance
	crit_multiplier = _crit_multiplier
	tap_damage_level = _tap_damage_level
	
func tap_damage() -> float:
	var damage_dealt = damage
	if randf() < crit_chance:
		damage_dealt *= crit_multiplier
	return	damage_dealt
	
func upgrade_tap_damage(level: int):
	damage += UpgradeData.get_player_tap_damage_increase(tap_damage_level,level)
	tap_damage_level += level
	
func upgrade_crit_chance(level:int):
	crit_chance += UpgradeData.player_crit_chance_increase_per_level*level
	crit_chance_level += level
	
func upgrade_crit_multiplier(level: int):
	crit_multiplier += UpgradeData.player_crit_multiplier_increase_per_level*level
	crit_multiplier_level += level
