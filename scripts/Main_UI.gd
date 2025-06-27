# File: MainUI.gd
extends Control

@onready var kamiya_panel = $VBoxContainer/ScrollContainer/ItemsList/UpgradePanel_Kamiya
@onready var coin_label = $VBoxContainer/Header/MarginContainer/HBoxContainer/CoinDisplay/Label

var player_coins = 68

func _ready():
	# Hubungkan sinyal 'action_pressed' dari panel Kamiya ke fungsi di script ini
	kamiya_panel.action_pressed.connect(_on_kamiya_levelup_pressed)
	
	# Update tampilan koin awal
	update_coin_display()
	
	# Contoh menonaktifkan tombol jika koin tidak cukup
	if player_coins < kamiya_panel.action_cost:
		kamiya_panel.set_button_disabled(true)

func update_coin_display():
	coin_label.text = str(player_coins)

func _on_kamiya_levelup_pressed():
	var cost = kamiya_panel.action_cost
	if player_coins >= cost:
		player_coins -= cost
		# Tambahkan logika level up di sini (misal: damage bertambah)
		kamiya_panel.item_level += 1
		
		# Perbarui tampilan setelah level up
		kamiya_panel.update_display()
		update_coin_display()
		
		print("Kamiya berhasil di-level up!")
	else:
		print("Koin tidak cukup!")
