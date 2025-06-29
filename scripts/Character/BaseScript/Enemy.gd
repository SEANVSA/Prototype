class_name Enemy

var name:String = "Titan"
var max_hp:Big = Big.new(1)
var hp:Big = Big.new(1)

func _init(_name:String, _max_hp: Big):
	name = _name
	max_hp = _max_hp
	hp = max_hp
	
func takeDamage(damage:Big) -> void:
	hp.minusEquals(damage)
	
func isAlive() -> bool:
	return hp.isGreaterThan(Big.new(0))

func getHp() -> Big:
	return hp

func getMaxHp() -> Big:
	return max_hp

func getName() -> String:
	return name
