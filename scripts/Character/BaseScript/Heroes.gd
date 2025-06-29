class_name Heroes extends Chara

var level: int = 1
var framePerAttack = 1

func _init(_name: String = "Hero",  _damage: float = 1.0):
	super(_name,_damage)

func getDamage() -> float:
	return damage
