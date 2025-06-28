
class_name UpgradeData extends Resource

# --- Player Tap Damage Upgrades ---
@export_group("Player Tap Damage Upgrades")
@export var player_base_tap_damage = 1
@export var player_tap_damage_base_cost: float = 10.0
@export var player_tap_damage_cost_multiplier: float = 1.2
@export var player_tap_damage_increase_per_level: float = 1.1

# --- Player Critical Chance Upgrades ---
@export_group("Player Critical Chance Upgrades")
@export var player_crit_chance_base_cost: float = 50.0
@export var player_crit_chance_cost_multiplier: float = 1.5
@export var player_crit_chance_increase_per_level: float = 0.01 # e.g., 1% per level

# --- Player Critical Multiplier Upgrades ---
@export_group("Player Critical Multiplier Upgrades")
@export var player_crit_multiplier_base_cost: float = 100.0
@export var player_crit_multiplier_cost_multiplier: float = 1.6
@export var player_crit_multiplier_increase_per_level: float = 0.1 # e.g., 0.1x multiplier

# --- Hero Level Upgrades (General for all Heroes) ---
# Note: Specific hero base costs/damages might still live in individual Heroes data objects
# or a separate HeroDefinitionData resource if you have many unique heroes.
@export_group("Hero Level Upgrades")
@export var hero_damage_multiplier_per_level: float = 1.15 # Heroes.gd already has this, could centralize
@export var hero_cost_multiplier_per_level: float = 1.1   # Heroes.gd already has this, could centralize
@export var hero_level_damage_increase_per_level: float = 1.0 # Base damage added per hero level



func get_player_tap_damage_upgrade_cost(current_level: int) -> float:
	return player_tap_damage_base_cost * pow(player_tap_damage_cost_multiplier, current_level)

func get_player_tap_damage_increase(current_level: int) -> float:
	return player_base_tap_damage * pow(player_tap_damage_increase_per_level, current_level)

func get_player_crit_chance_upgrade_cost(current_level: int) -> float:
	return player_crit_chance_base_cost * pow(player_crit_chance_cost_multiplier, current_level)

func get_player_crit_multiplier_upgrade_cost(current_level: int) -> float:
	return player_crit_multiplier_base_cost * pow(player_crit_multiplier_cost_multiplier, current_level)
