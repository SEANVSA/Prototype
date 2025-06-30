class_name Player extends Chara

var tap_damage_level: Big = Big.new(1)
var crit_chance_level: Big = Big.new(1)
var double_level: Big = Big.new(1)
var triple_level: Big = Big.new(1)
var crit_multiplier_level: Big = Big.new(1)
var crit_chance: Big = Big.new(0.0)
var crit_multiplier: Big = Big.new(0.0)
var double: Big = Big.new(0.001)
var triple: Big = Big.new(0.001)
var is_crit = false

func _init(_name: String = "Player",  _damage: Big = Big.new(1.0), _crit_chance: Big = Big.new(0.1), _crit_multiplier: Big = Big.new(2.0), _tap_damage_level:Big = Big.new(1), _double: Big = Big.new(1), _triple: Big = Big.new(1)):
	super(_name,_damage)
	crit_chance = _crit_chance
	crit_multiplier = _crit_multiplier
	tap_damage_level = _tap_damage_level
	double = _double
	triple = _triple
	
func tap_damage() -> Big:
	is_crit = false
	var damage_dealt:Big = Big.new(damage)
	if Big.new(randf()).isLessThan(crit_chance):
		damage_dealt.multiplyEquals(crit_multiplier)
		is_crit = true
	if Big.new(randf()).isLessThan(double):
		damage_dealt.multiplyEquals(2)
		is_crit = true
	if Big.new(randf()).isLessThan(triple):
		damage_dealt.multiplyEquals(3)
		is_crit = true
	return damage_dealt
	
func upgrade_tap_damage(level: Big):
	damage.plusEquals(UpgradeData.get_player_tap_damage_increase(tap_damage_level,level))
	tap_damage_level.plusEquals(level)
	
func upgrade_crit_chance(level:Big):
	crit_chance.plusEquals(UpgradeData.player_crit_chance_increase_per_level.multiply(level))
	crit_chance_level.plusEquals(level)
	
func upgrade_crit_multiplier(level: Big):
	crit_multiplier.plusEquals(UpgradeData.player_crit_multiplier_increase_per_level.multiply(level))
	crit_multiplier_level.plusEquals(level)
	
func upgrade_double(level:Big):
	double.plusEquals(UpgradeData.player_double_increase_per_level.multiply(level))
	double_level.plusEquals(level)

func upgrade_triple(level:Big):
	triple.plusEquals(UpgradeData.player_triple_increase_per_level.multiply(level))
	triple_level.plusEquals(level)
