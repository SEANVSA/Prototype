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
@onready var double = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 4 Box/Upgrade 4 Chance/UpgradeDPS"
@onready var progress4 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 4 Box/Upgrae 4 Icon Box/ProgressUpgrade4"
@onready var price4 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 4 Box/Upgrade 4 Button/Price&ChanceIncrease 3/Upgrade4Price/Price4"
@onready var addedChance2 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 4 Box/Upgrade 4 Button/Price&ChanceIncrease 3/ChacneIncrease 3/Chance"
@onready var button4 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 4 Box/Upgrade 4 Button"

@onready var nameLevel5 = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 5 Box/Upgrade 5 Chance/Label"
@onready var triple = $"PanelContainer/MarginContainer/VBoxContainer/Upgrade 5 Box/Upgrade 5 Chance/UpgradeChance"
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
	update_display()
	updateButton1()
	updateButton2()
	updateButton3()
	updateButton4()
	updateButton5()
	
func update_display():
	buyCount.text = "Buy "+buyCountNumber.toAA(true)+"x"
	coin.text = GlobalGold.gold.toAA()
	tap_damage_top.text = "-Tap Dmg : "+GameManager.player.damage.toAA()
	
func updateButton1():
	var tapLvl = Big.new(GameManager.player.tap_damage_level)
	var tapDmg = Big.new(GameManager.player.damage)
	nameLevel1.text = "Slash lvl: "+ tapLvl.toAA(true)
	tap_damage_bottom.text = "Tap Damage : "+tapDmg.toAA()
	price1.text = UpgradeData.get_player_tap_damage_upgrade_cost(tapLvl, buyCountNumber).toAA()
	addedDps.text = "+"+UpgradeData.get_player_tap_damage_increase(tapLvl, buyCountNumber).toAA()+" Dps"

func updateButton2():
	var critLvl = Big.new(GameManager.player.crit_multiplier_level)
	var critMul = Big.new(GameManager.player.crit_multiplier)
	nameLevel2.text = "Crit Damage lvl: "+ critLvl.toAA(true)
	crit_mul.text = "Multiplier: " + Number.format_percent(critMul)
	price2.text = UpgradeData.get_player_crit_multiplier_upgrade_cost(critLvl, buyCountNumber).toAA()
	addedMul.text = "+"+Number.format_percent(UpgradeData.player_crit_multiplier_increase_per_level.multiply(buyCountNumber))

func updateButton3():
	var critLvl = Big.new(GameManager.player.crit_chance_level)
	var critChance = Big.new(GameManager.player.crit_chance)
	if critChance.isLessThan(1):
		nameLevel3.text = "Crit Chance lvl: "+ critLvl.toAA(true)
		crit_chance.text = "Chance: "+ Number.format_percent(critChance)
		price3.text = UpgradeData.get_player_crit_chance_upgrade_cost(critLvl, buyCountNumber).toAA()
		addedChance.text = "+"+Number.format_percent(UpgradeData.player_crit_chance_increase_per_level.multiply(buyCountNumber))
	else :
		nameLevel3.text = "Crit Chance lvl: MAX"
		crit_chance.text = "Chance: 100%"
		price3.text = "MAXED"
		addedChance.text = "MAXED"
		button3.disabled = true

func updateButton4():
	var doubleLvl = Big.new(GameManager.player.double_level)
	var doubleChance = Big.new(GameManager.player.double)
	if doubleChance.isLessThan(1):
		nameLevel4.text = "Double Slash lvl: "+ doubleLvl.toAA(true)
		double.text = "Chance: "+ Number.format_percent(doubleChance)
		price4.text = UpgradeData.get_player_double_upgrade_cost(doubleLvl, buyCountNumber).toAA()
		addedChance2.text = "+"+Number.format_percent(UpgradeData.player_double_increase_per_level.multiply(buyCountNumber))
	else :
		nameLevel4.text = "Double Slash lvl: MAX"
		double.text = "Chance: 100%"
		price4.text = "MAXED"
		addedChance2.text = "MAXED"
		button4.disabled = true

func updateButton5():
	var tripleLvl = Big.new(GameManager.player.triple_level)
	var tripleChance = Big.new(GameManager.player.triple)
	if tripleChance.isLessThan(1):
		nameLevel5.text = "Triple Slash lvl: "+ tripleLvl.toAA(true)
		triple.text = "Chance: "+ Number.format_percent(tripleChance)
		price5.text = UpgradeData.get_player_triple_upgrade_cost(tripleLvl, buyCountNumber).toAA()
		addedChance3.text = "+"+Number.format_percent(UpgradeData.player_triple_increase_per_level.multiply(buyCountNumber))
	else :
		nameLevel5.text = "Triple Slash lvl: MAX"
		triple.text = "Chance: 100%"
		price5.text = "MAXED"
		addedChance3.text = "MAXED"
		button5.disabled = true

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
		updateButton1()
		update_display()

func _on_upgrade_2_button_pressed() -> void:
	if GlobalGold.spendGold(UpgradeData.get_player_crit_multiplier_upgrade_cost(GameManager.player.crit_multiplier_level, buyCountNumber)):
		GameManager.player.upgrade_crit_multiplier(buyCountNumber)
		updateButton2()


func _on_upgrade_3_button_pressed() -> void:
	if GlobalGold.spendGold(UpgradeData.get_player_crit_chance_upgrade_cost(GameManager.player.crit_chance_level, buyCountNumber)) and GameManager.player.crit_chance.isLessThan(1):
		GameManager.player.upgrade_crit_chance(buyCountNumber)
		updateButton3()


func _on_upgrade_4_button_pressed() -> void:
	if GlobalGold.spendGold(UpgradeData.get_player_double_upgrade_cost(GameManager.player.double_level, buyCountNumber)) and GameManager.player.double.isLessThan(1):
		GameManager.player.upgrade_double(buyCountNumber)
		updateButton4()


func _on_upgrade__5_button_pressed() -> void:
	if GlobalGold.spendGold(UpgradeData.get_player_triple_upgrade_cost(GameManager.player.triple_level, buyCountNumber)) and GameManager.player.triple.isLessThan(1):
		GameManager.player.upgrade_triple(buyCountNumber)
		updateButton5()
