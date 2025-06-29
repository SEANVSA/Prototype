
class_name UpgradeData extends Resource

# Player Tap Damage Upgrades
static var player_base_tap_damage: Big = Big.new(2)
static var player_tap_damage_base_cost: Big = Big.new(1.0)
static var player_tap_damage_cost_multiplier: Big = Big.new(1)
static var player_tap_damage_increase_per_level: Big = Big.new(1.1)

# Player Critical Chance Upgrades
static var player_crit_chance_base_cost: Big = Big.new(1)
static var player_crit_chance_cost_multiplier: Big = Big.new(1)
static var player_crit_chance_increase_per_level: Big = Big.new(0.01)

# Player Critical Multiplier Upgrades
static var player_crit_multiplier_base_cost: Big = Big.new(100.0)
static var player_crit_multiplier_cost_multiplier: Big = Big.new(1)
static var player_crit_multiplier_increase_per_level: Big = Big.new(0.1)

# Hero Level Upgrades
static var hero_damage_multiplier_per_level: Big = Big.new(1.15)
static var hero_cost_multiplier_per_level: Big = Big.new(1.1)
static var hero_level_damage_increase_per_level: Big = Big.new(1.0)

# Enemy to stage
static var enemy_base_hp: Big = Big.new(20)
static var enemy_hp_multiplier_per_stage: Big = Big.new(1.2)
static var enemy_gold_base_reward: Big = Big.new(10)
static var enemy_gold_multiplier_reward: Big = Big.new(1.5)

static func get_player_tap_damage_upgrade_cost(current_level: Big, level: Big) -> Big:
	if level.isEqualTo(1):
		return player_tap_damage_base_cost.multiply(player_tap_damage_cost_multiplier.power(current_level))
	return player_tap_damage_base_cost.multiply(player_tap_damage_cost_multiplier.power (current_level)).plus(get_player_tap_damage_upgrade_cost(current_level.plus(1), level.minus(1)))
static func get_player_tap_damage_increase(current_level: Big, level: Big) -> Big:
	if level.isEqualTo(1):
		return player_base_tap_damage.multiply(player_tap_damage_increase_per_level.power(current_level))
	return player_base_tap_damage.multiply(player_tap_damage_increase_per_level.power(current_level)).plus(get_player_tap_damage_increase(current_level.plus(1), level.minus(1)))

static func get_player_crit_chance_upgrade_cost(current_level: Big, level: Big) -> Big:
	if level.isEqualTo(1):
		return player_crit_chance_base_cost.multiply(player_crit_chance_cost_multiplier.power(current_level))
	return player_crit_chance_base_cost.multiply(player_crit_chance_cost_multiplier.power(current_level)).plus(get_player_crit_chance_upgrade_cost(current_level.plus(1), level.minus(1)))

static func get_player_crit_multiplier_upgrade_cost(current_level: Big, level: Big) -> Big:
	if level.isEqualTo(1):
		return player_crit_multiplier_base_cost.multiply(player_crit_multiplier_cost_multiplier.power(current_level))
	return player_crit_multiplier_base_cost.multiply(player_crit_multiplier_cost_multiplier.power(current_level)).plus(get_player_crit_multiplier_upgrade_cost(current_level.plus(1), level.minus(1)))
	
static func get_enemy_hp(current_stage: Big) -> Big:
	return enemy_base_hp.multiply(enemy_hp_multiplier_per_stage.power(current_stage))
static func get_enemy_gold_reward(current_stage: Big) -> Big:
	return enemy_gold_base_reward.multiply(enemy_gold_multiplier_reward.power(current_stage))
