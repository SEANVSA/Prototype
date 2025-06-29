class_name GameManager extends Node2D

@onready var player = $Player
var current_enemy: MonstersCharacter
var active_heroes: Array[Heroes] = []
var stage:int = 1
var gold:Resources
var enemies_per_stage: int
var defeated_enemies_this_stage: int
@export var enemy_definitions: Array[Dictionary] = [
	{ "name": "Blue Slime", "path": "res://scenes/Monster/Monster1.tscn"},
	{ "name": "Yellow Slime", "path": "res://scenes/Monster/Monster2.tscn"},
	{ "name": "Treant", "path": "res://scenes/Monster/Monster3.tscn"},
	{ "name": "Goblin", "path": "res://scenes/Monster/Monster4.tscn"}
]
@export var boss_definitions: Array[Dictionary] = [
	{ "name": "Treant", "path": "res://scenes/Monster/Monster3.tscn"},
]

@onready var enemy_spawn_container: Node2D = $EnemySpawnContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.set_player_data(Player.new())
	spawn_new_enemy()
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !current_enemy.monster.isAlive():
		spawn_new_enemy()
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

func spawn_new_enemy():
	for child in enemy_spawn_container.get_children():
		child.queue_free()
	var chosen_enemy_def = enemy_definitions.pick_random()
	var enemy_scene_path = chosen_enemy_def.get("path", "")
	var monster_name = chosen_enemy_def.get("name","")
	var enemy_scene = ResourceLoader.load(enemy_scene_path)
	current_enemy = enemy_scene.instantiate() as MonstersCharacter
	if current_enemy:
		enemy_spawn_container.add_child(current_enemy)
		current_enemy.set_monster_data(Enemy.new(monster_name, UpgradeData.get_enemy_hp(stage)))
