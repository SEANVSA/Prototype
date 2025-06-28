extends Node2D

var player: Player = null
var current_enemy: Enemy = null
var active_heroes: Array[Heroes] = []
var stage:int
var gold:Resources
var enemies_per_stage: int
var defeated_enemies_this_stage: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.set_player_data(Player.new("Player", 1, 0.5, 2))
	current_enemy.set_monster_data(Enemy.new("Slime", 100))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		player.set_animation("attack")
		current_enemy.takeDamage(player.getPlayer().tap_damage())
		
func start_new_game():
	gold = Resources.new(0)
	stage = 1
	enemies_per_stage = 10
	defeated_enemies_this_stage = 0
	
