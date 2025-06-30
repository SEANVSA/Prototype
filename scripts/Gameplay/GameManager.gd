class_name GameManager extends Node2D

var current_enemy: MonstersCharacter
var current_boss: BossCharacter
static var active_heroes: Array[Heroes] = []
static var stage:Big = Big.new(1)
var enemies_per_stage: Big = Big.new(10)
var defeated_enemies_this_stage: Big = Big.new(0)
static var player: Player
var onShop:bool = false

const MONSTER_FOLDER_PATH = "res://scenes/Monster/"
const BOSS_FOLDER_PATH = "res://scenes/Boss/"

@export var enemy_definitions: Array[Dictionary] = []
@export var boss_definitions: Array[Dictionary] = []
@export var heroes_defenition: Array[Dictionary] = []

@onready var playerVisual = $Player
@onready var camera = $Camera2D
@onready var enemy_spawn_container: Node2D = $EnemySpawnContainer
@onready var upgradePanel = $UpgradePanel
@onready var usenameLabel = $PanelContainer/MarginContainer/VBoxContainer/Username
@onready var levelLabel = $PanelContainer/MarginContainer/VBoxContainer/Lvl
@onready var goldLabel = $PanelContainer2/MarginContainer/HBoxContainer/Coin

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_new_game()
	connectSignal()
	populate_enemy_definitions()
	populate_boss_definitions()
	spawn_new_enemy()
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and !onShop:
		playerVisual.set_animation("attack")
		var damage = player.tap_damage()
		Number.display_damage(damage, enemy_spawn_container.global_position, player.is_crit)
		if current_enemy:
			if current_enemy.getMonster().getHp().isLessThan(damage):
				current_enemy.getMonster().alive = false
				current_enemy.isDefeated()
			else :
				current_enemy.takeDamage(damage)
		elif current_boss:
			if current_boss.getBoss().getHp().isLessThan(damage):
				current_boss.getBoss().alive = false
				current_boss.isDefeated()
			else :
				current_boss.takeDamage(player.tap_damage())

func connectSignal():
	upgradePanel.exit_buttton_pressed.connect(_on_exit_pressed)
	GlobalGold.gold_value_changed.connect(_on_gold_change)
	_on_gold_change()
	

func start_new_game():
	player = Player.new("Budi",Big.new(UpgradeData.player_base_tap_damage),Big.new(0.01),Big.new(1),Big.new(1),Big.new(0.01),Big.new(0.01))
	stage = Big.new(1)
	enemies_per_stage = Big.new(1)
	defeated_enemies_this_stage = Big.new(0)
	updateUI()

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
		current_boss.set_monster_data(Boss.new(boss_name, UpgradeData.get_enemy_hp(stage)))
		current_boss.boss_defeated.connect(_on_boss_defeated)
		current_boss.boss_escaped.connect(_on_boss_escaped)

func _on_enemy_defeated(enemy_data_object_id: int):
	GlobalGold.addGold(UpgradeData.get_enemy_gold_reward(stage))
	defeated_enemies_this_stage.plusEquals(1)
	if defeated_enemies_this_stage.isGreaterThanOrEqualTo(enemies_per_stage):
		spawn_new_boss()
	else:
		spawn_new_enemy()

func _on_boss_defeated(enemy_data_object_id: int):
	GlobalGold.addGold(UpgradeData.get_enemy_gold_reward(stage).multiply(10))
	stage.plusEquals(1)
	defeated_enemies_this_stage = Big.new(0)
	spawn_new_enemy()

func _on_boss_escaped(enemy_data_object_id: int):
	defeated_enemies_this_stage = Big.new(0)
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

func _on_exit_pressed():
	updateUI()
	camera.position.y = 0
	onShop = false

func _on_shop_pressed():
	camera.position.y = 650
	onShop = true
	upgradePanel.update_panel_display()

func _on_gold_change():
	goldLabel.text = GlobalGold.gold.toAA()
	
func updateUI():
	levelLabel.text = "Lvl : "+player.tap_damage_level.toAA(true)
	usenameLabel.text = player.name
	pass
