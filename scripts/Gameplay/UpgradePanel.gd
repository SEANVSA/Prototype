class_name UpgradePanel extends Node2D

@onready var tap_damage_top = $"PanelContainer/MarginContainer/VBoxContainer/Tap DMG Player/Dmg"
@onready var coin = $"PanelContainer/MarginContainer/VBoxContainer/Tap DMG Player/Coin"
@onready var buyCount = $PanelContainer/MarginContainer/VBoxContainer/BuyCountBox/BuyCountButton
signal exit_buttton_pressed

@onready var tap_damage_bottom = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 1 Box/Upgrade 1 DPS/UpgradeDPS"
@onready var progress1 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 1 Box/Upgrae 1 Icon Box/ProgressUpgrade1"
@onready var price1 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 1 Box/Upgrade 1 Button/Price&DPSIncrease 1/Upgrade1Price/Price1"
@onready var addedDps = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 1 Box/Upgrade 1 Button/Price&DPSIncrease 1/DPSIncrease 1/DPS"
@onready var button1 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 1 Box/Upgrade 1 Button"

@onready var crit_mul = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 2 Box/Upgrade 2 Chance/UpgradeDPS"
@onready var progress2 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 2 Box/Upgrae 2 Icon Box/ProgressUpgrade2"
@onready var price2 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 2 Box/Upgrade 2 Button/Price&DPSIncrease 2/Upgrade2Price/Price2"
@onready var addedMul = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 2 Box/Upgrade 2 Button/Price&DPSIncrease 2/DPSIncrease 2/DPS 2"
@onready var button2 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 2 Box/Upgrade 2 Button"

@onready var crit_chance = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 3 Box/Upgrade 3 Multy/UpgradeChance"
@onready var progress3 =$"PanelContainer/MarginContainer/VBoxContainer/Upgrade 3 Box/Upgrae 3 Icon Box/ProgressUpgrade3"
@onready var price3 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 3 Box/Upgrade 3 Button/Price&ChanceIncrease 1/Upgrade3Price/Price3"
@onready var addedChance = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 3 Box/Upgrade 3 Button/Price&ChanceIncrease 1/ChanceIncrease 1/Chance 1"
@onready var button3 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 3 Box/Upgrade 3 Button"

@onready var double_slash_chance = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 4 Box/Upgrade 4 Chance/UpgradeDPS"
@onready var progress4 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 4 Box/Upgrae 4 Icon Box/ProgressUpgrade4"
@onready var price4 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 4 Box/Upgrade 4 Button/Price&ChanceIncrease 3/Upgrade4Price/Price4"
@onready var addedChance2 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 4 Box/Upgrade 4 Button/Price&ChanceIncrease 3/ChacneIncrease 3/Chance"
@onready var button4 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 4 Box/Upgrade 4 Button"

@onready var triple_slash_chance = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 5 Box/Upgrade 5 Chance/UpgradeChance"
@onready var progress5 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 5 Box/Upgrae 5 Icon Box/ProgressUpgrade5"
@onready var price5 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 5 Box/Upgrade  5 Button/Price&ChanceIncrease 4/Upgrade5Price/Price5"
@onready var addedChance3 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 5 Box/Upgrade  5 Button/Price&ChanceIncrease 4/ChanceIncrease 4/Chance"
@onready var button5 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 5 Box/Upgrade  5 Button"
# Definisikan sinyal kustom saat tombol ditekan

func _ready():
	if GameManager.player:
		update_display()
func _process(delta: float) -> void:
	pass
func update_display():
	coin.text = str(GlobalGold.gold)
	price1.text = str(int(ceil(UpgradeData.get_player_tap_damage_upgrade_cost(GameManager.player.tap_damage_level))))

func set_button_disabled(disabled: bool):
	"""Fungsi untuk mengaktifkan/menonaktifkan tombol."""
	

func _on_action_button_pressed():
	# Saat tombol ditekan, emit sinyal kustom
	# Scene utama akan menangkap sinyal ini
	emit_signal("action_pressed")

func _on_exit_pressed():
	emit_signal("exit_buttton_pressed")
	
func _on_shop_preseed():
	update_display()

func _on_upgrade_1_button_pressed():
	if int(price1.text) <= GlobalGold.gold:
		GlobalGold.spendGold(int(price1.text))
		GameManager.player.upgrade_tap_damage(1)
		update_display()
