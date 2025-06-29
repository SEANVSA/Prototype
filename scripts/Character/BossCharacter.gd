class_name BossCharacter extends CharacterBody2D

signal boss_defeated(enemy_data_object_id:int)
signal boss_escaped(enemy_data_object_id:int)
@onready var anim = $AnimatedSprite2D
@onready var healthbar = $Label
@onready var timerLabel = $Label2
@onready var timer = $Timer
var boss:Boss = null

func _ready() -> void:
	updateTimer()
	updateHealthBar()
	timer.start(30)

func _process(delta: float) -> void:
	updateTimer()
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
	updateHealthBar()
	isDefeated()

func updateHealthBar():
	if boss:
		healthbar.text = "%s : %d / %d" % [boss.getName(), ceil(boss.getHp()), ceil(boss.getMaxHp())]
		healthbar.visible = true
	else:
		healthbar.visible = false
func updateTimer():
	if boss and timer.time_left>0 and timerLabel:
		timerLabel.text = "%d s" % ceil(timer.time_left)
		timerLabel.visible = true
	else:
		timerLabel.visible = false
func isDefeated() -> bool:
	if !boss.isAlive():
		emit_signal("boss_defeated", boss.get_instance_id())
		return true
	return false
	
func _on_timer_timeout() -> void:
	if boss.isAlive():
		print("boss escaped")
		emit_signal("boss_escaped", boss.get_instance_id())
