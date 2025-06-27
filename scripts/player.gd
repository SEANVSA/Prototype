extends CharacterBody2D
@onready var animation = $AnimatedSprite2D
var player : Player

func _ready() -> void:
	pass
	
func set_player_data(_player:Player):
	player = _player
	
func set_animation(anim_name:String):
	animation.play(anim_name)

func _on_animated_sprite_2d_animation_finished() -> void:
	if animation.animation == "attack":
		animation.play("Idle")
