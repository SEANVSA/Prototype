class_name Enemy

var name:String = "Titan"
var max_hp:Big = Big.new(1)
var hp:Big = Big.new(1)
var alive:bool = false

func _init(_name:String, _max_hp: Big):
	name = _name
	max_hp = _max_hp
	hp = Big.new(max_hp)
	alive = true
	
func takeDamage(damage:Big) -> void:
	hp.minusEquals(damage)
	if hp.isLessThan(0):
		alive = false

func getHp() -> Big:
	return hp

func getMaxHp() -> Big:
	return max_hp

func getName() -> String:
	return name
