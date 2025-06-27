class_name GameManager

extends Node2D

@onready var player = $Player
@onready var camera = $Camera2D
@onready var area = $Area2D
var stage:int = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.set_player_data(Player.new())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		player.set_animation("attack")
