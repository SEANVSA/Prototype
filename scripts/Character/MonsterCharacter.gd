class_name MonstersCharacter extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@onready var healthbar = $Label
var monster:Enemy = null

func _ready() -> void:
	updateHealthBar()
	pass

func set_monster_data(_monster:Enemy):
	monster = _monster

func _on_animated_sprite_2d_animation_finished() -> void:
	if anim.animation == "attacked":
		anim.play("idle")

func set_animation(anim_name:String):
	anim.play(anim_name)

func getMonster() -> Enemy:
	return monster

func takeDamage(damage:float) -> void:
	monster.takeDamage(damage)
	anim.play("attacked")
	updateHealthBar()

func updateHealthBar():
	if monster:
		healthbar.text = monster.getName() + ": "+str(monster.getHp()) + "/"+str(monster.getMaxHp())
		healthbar.visible = true
	else:
		healthbar.visible = false
