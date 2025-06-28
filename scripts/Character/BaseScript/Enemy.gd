class_name Enemy

var name:String = "Titan"
var max_hp:float = 1
var hp:float = 1

func _init(_name:String, _max_hp:float):
	name = _name
	max_hp = _max_hp
	hp = max_hp
	
func takeDamage(damage:float) -> void:
	hp -= damage
	
func isAlive() -> bool:
	return hp>0

func getHp() -> float:
	return hp

func getMaxHp() -> float:
	return max_hp

func getName() -> String:
	return name
