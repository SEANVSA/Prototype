extends CharacterBody2D
@onready var animation = $AnimatedSprite2D
var player : Player

func _ready() -> void:
	animation.play("Idle")
	
func set_player_data(_player:Player):
	player = _player
