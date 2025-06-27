extends CharacterBody2D
@onready var animation = $AnimatedSprite2D
var player : Player

func _ready() -> void:
	play_animation("idle")
	
func set_player_data(_player:Player):
	player = _player
func play_animation(anim_name:String):
	animation.play(anim_name)
