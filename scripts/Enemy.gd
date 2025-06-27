class_name Enemy

var name:String = "Titan"
var max_hp:int = 1
var hp:int = 1
var boss:bool = false

func _init(_name:String, _max_hp:int):
	name = _name
	max_hp = _max_hp
	hp = max_hp
	
func takeDamage(damage:int) -> void:
	hp -= damage
	
func isAlive() -> bool:
	return hp>0
	
func isBoss() -> bool:
	return boss
	
func setAsBoss():
	boss = true
