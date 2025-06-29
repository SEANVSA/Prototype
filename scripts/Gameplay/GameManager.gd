class_name GameManager extends Node2D

@onready var player = $Player
var current_enemy: MonstersCharacter
var current_boss: BossCharacter
var active_heroes: Array[Heroes] = []
var stage:int = 1
var gold:Resources
var enemies_per_stage: int = 5
var defeated_enemies_this_stage: int = 0

const MONSTER_FOLDER_PATH = "res://scenes/Monster/"
const BOSS_FOLDER_PATH = "res://scenes/Boss/"

@export var enemy_definitions: Array[Dictionary] = []
@export var boss_definitions: Array[Dictionary] = []
@export var heroes_defenition: Array[Dictionary] = []

@onready var enemy_spawn_container: Node2D = $EnemySpawnContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.set_player_data(Player.new("Player",1,0.5,3))
	populate_enemy_definitions()
	populate_boss_definitions()
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
			current_boss.takeDamage(player.getPlayer().tap_damage())
		
func start_new_game():
	gold = Resources.new(0)
	stage = 1
	enemies_per_stage = 100
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
	defeated_enemies_this_stage = 0
	spawn_new_enemy()
func _on_boss_escaped(enemy_data_object_id: int):
	spawn_new_enemy()
	pass

func populate_enemy_definitions():
	enemy_definitions.clear() # Clear existing definitions

	var dir = DirAccess.open(MONSTER_FOLDER_PATH)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				# Skip directories (if you have subfolders within Monster)
				pass 
			else:
				# Check if it's a .tscn file
				if file_name.ends_with(".tscn"):
					var full_path = MONSTER_FOLDER_PATH + file_name
					
					# Get the name without extension (e.g., "Blue Slime")
					var name = file_name.get_file().get_basename()
					
					var enemy_data = {
						"name": name,
						"path": full_path
					}
					enemy_definitions.append(enemy_data)
			file_name = dir.get_next()
		dir.list_dir_end()
	else:
		printerr("Could not open directory: ", MONSTER_FOLDER_PATH)
		
func populate_boss_definitions():
	boss_definitions.clear() # Clear existing definitions

	var dir = DirAccess.open(BOSS_FOLDER_PATH)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass 
			else:
				if file_name.ends_with(".tscn"):
					var full_path = BOSS_FOLDER_PATH + file_name
					var name = file_name.get_file().get_basename()
					var boss_data = {
						"name": name,
						"path": full_path
					}
					boss_definitions.append(boss_data)
			file_name = dir.get_next()
		dir.list_dir_end()
	else:
		printerr("Could not open directory: ", BOSS_FOLDER_PATH)
