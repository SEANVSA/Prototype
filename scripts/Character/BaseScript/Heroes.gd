class_name Heroes extends Chara

var level: Big = Big.new(1)
var framePerAttack = 1

func _init(_name: String = "Hero",  _damage: Big = Big.new(1.0)):
	super(_name,_damage)

func getDamage() -> Big:
	return damage
