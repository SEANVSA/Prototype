class_name Heroes extends Chara

var level: int = 1
var base_cost: float = 0.0
var cost_multiplier_per_level: float = 1.1
var damage_multiplier_per_level: float = 1.1

func _init(_name: String = "Hero",  _damage: float = 1.0,_base_cost: float = 0.0):
	super(_name,_damage)
	base_cost = _base_cost
	
func get_upgrade_cost() -> float:
	return base_cost * pow(cost_multiplier_per_level, level)

func upgrade():
	level += 1
	damage *= damage_multiplier_per_level # Increase hero's damage
