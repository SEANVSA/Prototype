
class_name UpgradeData extends Resource

# Player Tap Damage Upgrades
static var player_base_tap_damage: float = 1
static var player_tap_damage_base_cost: float = 1.0
static var player_tap_damage_cost_multiplier: float = 1
static var player_tap_damage_increase_per_level: float = 1.1

# Player Critical Chance Upgrades
static var player_crit_chance_base_cost: float = 1
static var player_crit_chance_cost_multiplier: float = 1
static var player_crit_chance_increase_per_level: float = 0.01

# Player Critical Multiplier Upgrades
static var player_crit_multiplier_base_cost: float = 100.0
static var player_crit_multiplier_cost_multiplier: float = 1
static var player_crit_multiplier_increase_per_level: float = 0.1

# Hero Level Upgrades
static var hero_damage_multiplier_per_level: float = 1.15 
static var hero_cost_multiplier_per_level: float = 1.1
static var hero_level_damage_increase_per_level: float = 1.0 

# Enemy to stage
static var enemy_base_hp: float = 20
static var enemy_hp_multiplier_per_stage: float = 1.2
static var enemy_gold_base_reward: int = 10
static var enemy_gold_multiplier_reward: float = 1.5

static func get_player_tap_damage_upgrade_cost(current_level: int, level: int) -> float:
	if level == 1:
		return ceil(player_tap_damage_base_cost * pow(player_tap_damage_cost_multiplier, current_level))
	return ceil(player_tap_damage_base_cost * pow(player_tap_damage_cost_multiplier, current_level)) + get_player_tap_damage_upgrade_cost(current_level+1, level-1)
static func get_player_tap_damage_increase(current_level: int, level: int) -> float:
	if level == 1:
		return player_base_tap_damage * pow(player_tap_damage_increase_per_level, current_level)
	return player_base_tap_damage * pow(player_tap_damage_increase_per_level, current_level) + get_player_tap_damage_increase(current_level+1, level-1)

static func get_player_crit_chance_upgrade_cost(current_level: int, level: int) -> float:
	if level == 1:
		return ceil(player_crit_chance_base_cost * pow(player_crit_chance_cost_multiplier, current_level))
	return ceil(player_crit_chance_base_cost * pow(player_crit_chance_cost_multiplier, current_level)) + ceil(get_player_crit_chance_upgrade_cost(current_level+1, level-1))

static func get_player_crit_multiplier_upgrade_cost(current_level: int, level: int) -> float:
	if level == 1:
		return ceil(player_crit_multiplier_base_cost * pow(player_crit_multiplier_cost_multiplier, current_level))
	return ceil(player_crit_multiplier_base_cost * pow(player_crit_multiplier_cost_multiplier, current_level)) + get_player_crit_multiplier_upgrade_cost(current_level+1,level-1)
	
static func get_enemy_hp(curret_stage: int) -> float:
	return enemy_base_hp * pow(enemy_hp_multiplier_per_stage, curret_stage)
static func get_enemy_gold_reward(curret_stage: int) -> int:
	return enemy_gold_base_reward * pow(enemy_gold_multiplier_reward, curret_stage)
