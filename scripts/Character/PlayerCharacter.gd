extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
var player : Player = null

func _ready() -> void:
	pass
	
func set_player_data(_player:Player):
	player = _player
	
func _on_animated_sprite_2d_animation_finished() -> void:
	if anim.animation == "attack":
		anim.play("idle")

func set_animation(anim_name:String):
	anim.play(anim_name)

func getPlayer() -> Player:
	return player
