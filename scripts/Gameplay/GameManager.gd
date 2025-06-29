class_name GameManager extends Node2D

@onready var player = $Player
var current_enemy: MonstersCharacter
var current_boss: BossCharacter
var active_heroes: Array[Heroes] = []
var stage:int = 1
var gold:Resources
var enemies_per_stage: int = 2
var defeated_enemies_this_stage: int = 0

@export var enemy_definitions: Array[Dictionary] = [
	{ "name": "Blue Slime", "path": "res://scenes/Monster/Monster1.tscn"},
	{ "name": "Yellow Slime", "path": "res://scenes/Monster/Monster2.tscn"},
	{ "name": "Goblin", "path": "res://scenes/Monster/Monster4.tscn"}
]
@export var boss_definitions: Array[Dictionary] = [
	{ "name": "Treant", "path": "res://scenes/Boss/Monster3.tscn"},
]

@onready var enemy_spawn_container: Node2D = $EnemySpawnContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.set_player_data(Player.new("Player",10,0.5,3))
	spawn_new_enemy()
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		player.set_animation("attack")
		if current_enemy:
			current_enemy.takeDamage(player.getPlayer().tap_damage())
		elif current_boss:
			print(current_boss.timer.time_left)
			current_boss.takeDamage(player.getPlayer().tap_damage())
		
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
		current_enemy.enemy_defeated.connect(_on_enemy_defeated)
		
func spawn_new_boss():
	for child in enemy_spawn_container.get_children():
		child.queue_free()
	var chosen_boss_def = boss_definitions.pick_random()
	var boss_scene_path = chosen_boss_def.get("path", "")
	var boss_name = chosen_boss_def.get("name","")
	var boss_scene = ResourceLoader.load(boss_scene_path)
	current_boss = boss_scene.instantiate() as BossCharacter
	if current_boss:
		enemy_spawn_container.add_child(current_boss)
		current_boss.set_monster_data(Boss.new(boss_name, UpgradeData.get_enemy_hp(stage)*10))
		current_boss.boss_defeated.connect(_on_boss_defeated)
		current_boss.boss_escaped.connect(_on_boss_escaped)
		


func _on_enemy_defeated(enemy_data_object_id: int):
	defeated_enemies_this_stage += 1
	if defeated_enemies_this_stage > enemies_per_stage:
		print("Boss spawned")
		spawn_new_boss()
	else:
		spawn_new_enemy()
func _on_boss_defeated(enemy_data_object_id: int):
	stage+=1
	spawn_new_enemy()
func _on_boss_escaped(enemy_data_object_id: int):
	spawn_new_enemy()
	pass
