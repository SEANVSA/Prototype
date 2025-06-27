# File: UpgradePanel.gd
extends PanelContainer

# Variabel yang akan kita isi dari scene utama
@export var item_name: String
@export var item_level: int
@export var item_description: String
@export var item_icon: Texture2D
@export var progress: float # Nilai dari 0.0 sampai 1.0
@export var action_cost: int
@export var action_text: String
@export var action_subtext: String

# Hubungkan Node dari editor ke script ini
@onready var name_label = $MarginContainer/HBoxContainer/Info/NameLabel
@onready var level_label = $MarginContainer/HBoxContainer/Info/LevelLabel
@onready var desc_label = $MarginContainer/HBoxContainer/DescLabel
@onready var item_icon_rect = $MarginContainer/HBoxContainer/ItemIcon
@onready var progress_bar = $MarginContainer/HBoxContainer/Info/ProgressBar
@onready var action_button = $MarginContainer/HBoxContainer/ActionButton
@onready var cost_label = $MarginContainer/HBoxContainer/ActionButton/VBoxContainer/Cost/CostLabel
@onready var action_label = $MarginContainer/HBoxContainer/ActionButton/VBoxContainer/ActionLabel
@onready var sub_action_label = $MarginContainer/HBoxContainer/ActionButton/VBoxContainer/SubActionLabel

# Definisikan sinyal kustom saat tombol ditekan
signal action_pressed

func _ready():
	# Panggil fungsi untuk mengisi data ke UI saat scene siap
	update_display()
	action_button.pressed.connect(_on_action_button_pressed)

func update_display():
	"""Fungsi untuk mengisi semua elemen UI dengan data dari variabel export."""
	name_label.text = item_name
	level_label.text = "Lv. " + str(item_level)
	desc_label.text = item_description
	item_icon_rect.texture = item_icon
	progress_bar.value = progress * 100 # ProgressBar biasanya pakai nilai 0-100
	
	cost_label.text = str(action_cost)
	action_label.text = action_text
	sub_action_label.text = action_subtext

func set_button_disabled(disabled: bool):
	"""Fungsi untuk mengaktifkan/menonaktifkan tombol."""
	action_button.disabled = disabled
	if disabled:
		action_button.modulate = Color(0.5, 0.5, 0.5, 1) # Beri warna abu-abu
	else:
		action_button.modulate = Color(1, 1, 1, 1)

func _on_action_button_pressed():
	# Saat tombol ditekan, emit sinyal kustom
	# Scene utama akan menangkap sinyal ini
	emit_signal("action_pressed")
