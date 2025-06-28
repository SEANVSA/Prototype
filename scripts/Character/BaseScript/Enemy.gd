class_name Enemy

var name:String = "Titan"
var max_hp:int = 1
var hp:int = 1

func _init(_name:String, _max_hp:int):
	name = _name
	max_hp = _max_hp
	hp = max_hp
	
func takeDamage(damage:int) -> void:
	hp -= damage
	
func isAlive() -> bool:
	return hp>0

func getHp() -> int:
	return hp

func getMaxHp() -> int:
	return max_hp

func getName() -> String:
	return name
