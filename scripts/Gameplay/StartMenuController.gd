extends Node2D

const save_file_path = "res://save/"
var save_file_found: bool = false

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var dir = DirAccess.open(save_file_path)
		if dir:
			dir.list_dir_begin()
			var file_name = dir.get_next()
			while file_name != "":
				if dir.current_is_dir():
					# Skip directories (if you have subfolders within Monster)
					pass 
				else:
					# Check if it's a .tscn file
					if file_name.ends_with(".save"):
						var full_path = save_file_path + file_name
						save_file_found = true
				file_name = dir.get_next()
			dir.list_dir_end()
		if save_file_found:
			get_tree().change_scene_to_file("res://scenes/GameScene.tscn")
		else :
			get_tree().change_scene_to_file("res://scenes/InputUserName.tscn")
