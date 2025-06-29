class_name HeroesCharacter extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
var hero:Heroes = null

func _ready() -> void:
	pass

func set_heroes_data(data:Heroes):
	hero = data
	
func _on_animated_sprite_2d_animation_finished() -> void:
	if anim.animation == "attack":
		anim.play("idle")

func set_animation(anim_name:String):
	anim.play(anim_name)

func getHeroes() -> Heroes:
	return hero
