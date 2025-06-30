class_name PlayerCharacter extends CharacterBody2D

@onready var anim = $AnimatedSprite2D

func _ready() -> void:
	pass

func _on_animated_sprite_2d_animation_finished() -> void:
	if anim.animation == "attack":
		anim.play("idle")

func set_animation(anim_name:String):
	anim.play(anim_name)
