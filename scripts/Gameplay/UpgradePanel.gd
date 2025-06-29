class_name UpgradePanel extends Node2D

@onready var tap_damage_top = $"PanelContainer/MarginContainer/VBoxContainer/Tap DMG Player/Dmg"
@onready var coin = $"PanelContainer/MarginContainer/VBoxContainer/Tap DMG Player/Coin"
@onready var buyCount = $PanelContainer/MarginContainer/VBoxContainer/BuyCountBox/BuyCountButton
var buyCountNumber: Big = Big.new(1)
signal exit_buttton_pressed

@onready var nameLevel1 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 1 Box/Upgrade 1 DPS/Label"
@onready var tap_damage_bottom = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 1 Box/Upgrade 1 DPS/UpgradeDPS"
@onready var progress1 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 1 Box/Upgrae 1 Icon Box/ProgressUpgrade1"
@onready var price1 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 1 Box/Upgrade 1 Button/Price&DPSIncrease 1/Upgrade1Price/Price1"
@onready var addedDps = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 1 Box/Upgrade 1 Button/Price&DPSIncrease 1/DPSIncrease 1/DPS"
@onready var button1 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 1 Box/Upgrade 1 Button"

@onready var nameLevel2 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 2 Box/Upgrade 2 Chance/Label"
@onready var crit_mul = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 2 Box/Upgrade 2 Chance/UpgradeDPS"
@onready var progress2 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 2 Box/Upgrae 2 Icon Box/ProgressUpgrade2"
@onready var price2 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 2 Box/Upgrade 2 Button/Price&DPSIncrease 2/Upgrade2Price/Price2"
@onready var addedMul = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 2 Box/Upgrade 2 Button/Price&DPSIncrease 2/DPSIncrease 2/DPS 2"
@onready var button2 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 2 Box/Upgrade 2 Button"

@onready var nameLevel3 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 3 Box/Upgrade 3 Multy/Label"
@onready var crit_chance = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 3 Box/Upgrade 3 Multy/UpgradeChance"
@onready var progress3 =$"PanelContainer/MarginContainer/VBoxContainer/Upgrade 3 Box/Upgrae 3 Icon Box/ProgressUpgrade3"
@onready var price3 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 3 Box/Upgrade 3 Button/Price&ChanceIncrease 1/Upgrade3Price/Price3"
@onready var addedChance = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 3 Box/Upgrade 3 Button/Price&ChanceIncrease 1/ChanceIncrease 1/Chance 1"
@onready var button3 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 3 Box/Upgrade 3 Button"

@onready var nameLevel4 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 4 Box/Upgrade 4 Chance/Label"
@onready var double_slash_chance = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 4 Box/Upgrade 4 Chance/UpgradeDPS"
@onready var progress4 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 4 Box/Upgrae 4 Icon Box/ProgressUpgrade4"
@onready var price4 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 4 Box/Upgrade 4 Button/Price&ChanceIncrease 3/Upgrade4Price/Price4"
@onready var addedChance2 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 4 Box/Upgrade 4 Button/Price&ChanceIncrease 3/ChacneIncrease 3/Chance"
@onready var button4 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 4 Box/Upgrade 4 Button"

@onready var nameLevel5 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 5 Box/Upgrade 5 Chance/Label"
@onready var triple_slash_chance = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 5 Box/Upgrade 5 Chance/UpgradeChance"
@onready var progress5 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 5 Box/Upgrae 5 Icon Box/ProgressUpgrade5"
@onready var price5 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 5 Box/Upgrade  5 Button/Price&ChanceIncrease 4/Upgrade5Price/Price5"
@onready var addedChance3 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 5 Box/Upgrade  5 Button/Price&ChanceIncrease 4/ChanceIncrease 4/Chance"
@onready var button5 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 5 Box/Upgrade  5 Button"
# Definisikan sinyal kustom saat tombol ditekan

func _ready():
	if GameManager.player:
		update_panel_display()
func _process(delta: float) -> void:
	pass
func update_panel_display():
	buyCount.text = "Buy "+buyCountNumber.toString()+"x"
	coin.text = GlobalGold.gold.toAA()
	tap_damage_top.text = "-Tap Dmg : "+GameManager.player.damage.toAA()
	
	nameLevel1.text = "Slash lvl: "+ GameManager.player.tap_damage_level.toAA()
	tap_damage_bottom.text = "Tap Damage : "+GameManager.player.damage.toAA()
	price1.text = UpgradeData.get_player_tap_damage_upgrade_cost(GameManager.player.tap_damage_level, buyCountNumber).toAA()
	addedDps.text = "+"+UpgradeData.get_player_tap_damage_increase(GameManager.player.tap_damage_level, buyCountNumber).toAA()+" Dps"
	
	nameLevel2.text = "Crit Damage lvl: "+ GameManager.player.crit_multiplier_level.toAA()
	crit_mul.text = "Multiplier: " + Number.format_percent(GameManager.player.crit_multiplier)
	price2.text = UpgradeData.get_player_crit_multiplier_upgrade_cost(GameManager.player.crit_multiplier_level, buyCountNumber).toAA()
	addedMul.text = "+"+Number.format_percent(UpgradeData.player_crit_multiplier_increase_per_level.multiply(buyCountNumber))
	
	if GameManager.player.crit_chance.isLessThan(1):
		nameLevel3.text = "Crit Chance lvl: "+ GameManager.player.crit_chance_level.toAA()
		crit_chance.text = "Chance: "+ Number.format_percent(GameManager.player.crit_chance)
		price3.text = UpgradeData.get_player_crit_chance_upgrade_cost(GameManager.player.crit_chance_level, buyCountNumber).toAA()
		addedChance.text = "+"+Number.format_percent(UpgradeData.player_crit_chance_increase_per_level.multiply(buyCountNumber))
	else :
		nameLevel3.text = "Crit Chance lvl: MAX"
		crit_chance.text = "Chance: 100%"
		price3.text = "MAXED"
		addedChance.text = "MAXED"
		button3.disabled = true
	
func _on_exit_pressed():
	emit_signal("exit_buttton_pressed")
	
func _on_shop_preseed():
	update_panel_display()
	
func _on_buy_count_button_pressed() -> void:
	if buyCountNumber.isEqualTo(100):
		buyCountNumber = Big.new(1)
	else: 
		buyCountNumber.multiplyEquals(10)
	update_panel_display()

func _on_upgrade_1_button_pressed():
	if GlobalGold.spendGold(UpgradeData.get_player_tap_damage_upgrade_cost(GameManager.player.tap_damage_level, buyCountNumber)):
		GameManager.player.upgrade_tap_damage(buyCountNumber)
		update_panel_display()

func _on_upgrade_2_button_pressed() -> void:
	if GlobalGold.spendGold(UpgradeData.get_player_crit_multiplier_upgrade_cost(GameManager.player.crit_multiplier_level, buyCountNumber)):
		GameManager.player.upgrade_crit_multiplier(buyCountNumber)
		update_panel_display()


func _on_upgrade_3_button_pressed() -> void:
	if GlobalGold.spendGold(UpgradeData.get_player_crit_chance_upgrade_cost(GameManager.player.crit_chance_level, buyCountNumber)) and GameManager.player.crit_chance.isLessThan(1):
		GameManager.player.upgrade_crit_chance(buyCountNumber)
		update_panel_display()


func _on_upgrade_4_button_pressed() -> void:
	pass # Replace with function body.


func _on_upgrade__5_button_pressed() -> void:
	pass # Replace with function body.
