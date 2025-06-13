extends Node
class_name Entity
@export var entity_name: String = "Unnamed Entity"
@export var current_health: float = 100.0
@export var max_health: float = 100.0
@export var attack_power: float = 10.0
@export var attack_speed: float = 1.0 # Attacks per second
@export var is_alive: bool = true

func _init(name: String = "Unnamed", health: float = 100.0, power: float = 10.0, speed: float = 1.0):
	entity_name = name
	max_health = health
	current_health = health
	attack_power = power
	attack_speed = speed
	
func get_dps(dps_multiplier: float) -> float:
	return attack_power * attack_speed * dps_multiplier
func take_damage(amount: float):
	current_health -= amount
	if current_health <= 0:
		current_health = 0
		is_alive = false
		_on_death()
	# print(entity_name, " took ", amount, " damage. Health: ", current_health)

func heal(amount: float):
	current_health += amount
	if current_health > max_health:
		current_health = max_health
	# print(entity_name, " healed for ", amount, ". Health: ", current_health)

func attack(target_entity: Entity):
	if is_alive and target_entity.is_alive:
		# print(entity_name, " attacks ", target_entity.entity_name, " for ", attack_power, " damage.")
		target_entity.take_damage(attack_power)

# Virtual function for death logic (can be overridden by derived classes)
func _on_death():
	# print(entity_name, " has been defeated!")
	queue_free() # In a real game, you might hide the entity, play animation, etc.
