class_name BossCharacter extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
var boss:Boss = null

func _ready() -> void:
	pass

func set_monster_data(_boss:Enemy):
	boss = _boss

func _on_animated_sprite_2d_animation_finished() -> void:
	if anim.animation == "attacked":
		anim.play("idle")

func set_animation(anim_name:String):
	anim.play(anim_name)

func getBoss() -> Boss:
	return boss

func takeDamage(damage:float) -> void:
	boss.takeDamage(damage)
	anim.play("attacked")
