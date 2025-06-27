extends CharacterBody2D

@onready var animation = $AnimatedSprite2D
var reaper:Heroes

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass

func set_Reaper_data(_reaper:Heroes):
	reaper = _reaper
	
func set_animation(anim_name:String):
	animation.play(anim_name)
