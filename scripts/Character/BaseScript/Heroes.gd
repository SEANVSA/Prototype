class_name Heroes extends Chara

var level: Big = Big.new(1)
var framePerAttack: int = 1
var cost: Big = Big.new(100) 

func _init(_name: String = "Hero",  _damage: Big = Big.new(1.0), _level: Big = Big.new(1), _framePerAttack = 1, _cost: Big = Big.new(100)):
	super(_name,_damage)
	level = Big.new(_level)
	framePerAttack = _framePerAttack
	cost = Big.new(_cost)
func getDamage() -> Big:
	return damage
func upgradeDamage(_level: Big) -> void:
	damage.plusEquals(UpgradeData.get_hero_damage_increase(level,_level))
