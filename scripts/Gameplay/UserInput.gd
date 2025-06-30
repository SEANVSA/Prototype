extends Node2D

@onready var username = $PanelContainer/MarginContainer/PanelContainer/MarginContainer/VBoxContainer/TextEdit
@onready var confirm = $PanelContainer/MarginContainer/PanelContainer/MarginContainer/VBoxContainer/Button



func _on_confirm_pressed() -> void:
	if username and username.text != "":
		UpgradeData.player_name = username.text
		get_tree().change_scene_to_file("res://scenes/GameScene.tscn")

func _input(event: InputEvent) -> void:
	if Input.is_key_pressed(KEY_ENTER):
		if username and username.text != "":
			UpgradeData.player_name = username.text
			get_tree().change_scene_to_file("res://scenes/GameScene.tscn")
