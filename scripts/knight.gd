extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -200.0
@onready var animate: AnimatedSprite2D = $AnimatedSprite2D
@onready var head_box: CollisionShape2D = $HeadBox
var hidup = 1

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() and head_box.disabled == false:
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction == -1:
		animate.flip_h = true
	elif direction == 1:
		animate.flip_h = false
		
	if hidup == 1:	
		head_box.disabled = false
		if direction:
			animate.play("run")
			velocity.x = direction * SPEED
		else:
			animate.play("idle")
			velocity.x = move_toward(velocity.x, 0, SPEED)
			
		if Input.is_action_pressed("move_down"):
			velocity.x *= 0.5 
			animate.play("duck")
			head_box.disabled = true

	move_and_slide()
