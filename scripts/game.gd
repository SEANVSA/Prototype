extends Node2D

@onready var knight: CharacterBody2D = $Knight
@onready var camera_2d: Camera2D = $Camera2D
var max_x_distance = 25
var max_y_distance = 1
var camera_speed = 0.05
var zoom = 4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if has_node("Knight") and has_node("Camera2D"):
		camera_2d.position = knight.position
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("camera_lock"):
		max_x_distance = 25
		max_y_distance = 1
		camera_2d.position = knight.position
	
	if Input.is_action_pressed("move_camera_left") and camera_2d.position.x - knight.position.x>-100:
		max_x_distance = 100
		max_y_distance = 50
		camera_2d.position.x -= camera_speed
	if Input.is_action_pressed("move_camera_right") and camera_2d.position.x - knight.position.x<100:
		max_x_distance = 100
		max_y_distance = 50
		camera_2d.position.x += camera_speed
	if Input.is_action_pressed("move_camera_up") and camera_2d.position.y - knight.position.y>-50:
		max_x_distance = 100
		max_y_distance = 50
		camera_2d.position.y -= camera_speed
	if Input.is_action_pressed("move_camera_down") and camera_2d.position.y - knight.position.y<50:
		max_x_distance = 100
		max_y_distance = 50
		camera_2d.position.y += camera_speed
	#camera lock player
	if has_node("Knight") and has_node("Camera2D") and camera_2d.position.x - knight.position.x>max_x_distance:
		camera_2d.position.x = knight.position.x+max_x_distance
	elif has_node("Knight") and has_node("Camera2D") and camera_2d.position.x - knight.position.x<-1*max_x_distance:
		camera_2d.position.x = knight.position.x-max_x_distance
	if has_node("Knight") and has_node("Camera2D") and camera_2d.position.y - knight.position.y>max_y_distance:
		camera_2d.position.y = knight.position.y+max_y_distance
	elif has_node("Knight") and has_node("Camera2D") and camera_2d.position.y - knight.position.y<-1*max_y_distance:
		camera_2d.position.y = knight.position.y-max_y_distance
func setZoom(zoom : int):
	camera_2d.zoom.x = zoom
	camera_2d.zoom.y = zoom
