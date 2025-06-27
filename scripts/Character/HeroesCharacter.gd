extends CharacterBody2D

@onready var animation = $AnimatedSprite2D
var hero:Heroes = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func set_heroes_data(data:Heroes):
	hero = data
	
func set_animation(anim_name:String):
	animation.play(anim_name)

func get_upgrade_cost() -> float:
	return hero.get_upgrade_cost()

func upgrade():
	hero.upgrade()
