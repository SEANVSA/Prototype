extends Entity

class_name Heroes

# --- Hero Specific Properties ---
@export var level: int = 1
@export var current_experience: float = 0.0
@export var experience_to_next_level: float = 100.0
@export var gold_gain_multiplier: float = 1.0

# --- Constructor (overrides Entity's _init) ---
func _init(name: String = "New Hero", health: float = 100.0, power: float = 10.0, speed: float = 1.0, lvl: int = 1):
	# Call the base class constructor
	super._init(name, health, power, speed)
	level = lvl
	experience_to_next_level = 100 * pow(1.2, level - 1) # Scaling XP requirement

# --- Hero Specific Methods ---
func gain_experience(amount: float):
	current_experience += amount
	# print(entity_name, " gained ", amount, " XP. Current XP: ", current_experience)
	while current_experience >= experience_to_next_level:
		level_up()

func level_up():
	current_experience -= experience_to_next_level
	level += 1
	max_health *= 1.1 # Increase stats on level up
	current_health = max_health
	attack_power *= 1.15
	attack_speed *= 1.05
	experience_to_next_level = 100 * pow(1.2, level - 1)
	# print(entity_name, " leveled up to Level ", level, "!")
	# You might want to emit a signal here for UI updates

# Override _on_death for hero-specific death logic (e.g., respawn, game over)
func _on_death():
	# print(entity_name, " has fallen! Returning to base...")
	is_alive = true # Prevent immediate removal
	current_health = max_health / 2 # Respawn with half health
	# In a real game, you might add a respawn timer, UI message, etc.
