extends PanelContainer

@onready var tap_damage_top = $"VBoxContainer/Tap DMG Player/Dmg"
@onready var coin = $"VBoxContainer/Tap DMG Player/Coin"
@onready var buyCount = $VBoxContainer/BuyCountBox/BuyCountButton

@onready var tap_damage_bottom = $"VBoxContainer/Upgrade 1 Box/Upgrade 1 DPS/UpgradeDPS"
@onready var progress1 = $"VBoxContainer/Upgrade 1 Box/Upgrae 1 Icon Box/ProgressUpgrade1"
@onready var price1 = $"VBoxContainer/Upgrade 1 Box/Upgrade 1 Button/Price&DPSIncrease 1/Upgrade1Price/Price1"
@onready var addedDps = $"VBoxContainer/Upgrade 1 Box/Upgrade 1 Button/Price&DPSIncrease 1/DPSIncrease 1/DPS"
@onready var button1 = $"VBoxContainer/Upgrade 1 Box/Upgrade 1 Button"

@onready var crit_mul = $"VBoxContainer/Upgrade 2 Box/Upgrade 2 Chance/UpgradeDPS"
@onready var progress2 = $"VBoxContainer/Upgrade 2 Box/Upgrae 2 Icon Box/ProgressUpgrade2"
@onready var price2 = $"VBoxContainer/Upgrade 2 Box/Upgrade 2 Button/Price&DPSIncrease 2/Upgrade2Price/Price2"
@onready var addedMul = $"VBoxContainer/Upgrade 2 Box/Upgrade 2 Button/Price&DPSIncrease 2/DPSIncrease 2/DPS 2"
@onready var button2 = $"VBoxContainer/Upgrade 2 Box/Upgrade 2 Button"

@onready var crit_chance = $"VBoxContainer/Upgrade 3 Box/Upgrade 3 Multy/UpgradeChance"
@onready var progress3 =$"VBoxContainer/Upgrade 3 Box/Upgrae 3 Icon Box/ProgressUpgrade3"
@onready var price3 = $"VBoxContainer/Upgrade 3 Box/Upgrade 3 Button/Price&ChanceIncrease 1/Upgrade3Price/Price3"
@onready var addedChance = $"VBoxContainer/Upgrade 3 Box/Upgrade 3 Button/Price&ChanceIncrease 1/ChanceIncrease 1/Chance 1"
@onready var button3 = $"VBoxContainer/Upgrade 3 Box/Upgrade 3 Button"

# Definisikan sinyal kustom saat tombol ditekan
signal action_pressed

func _ready():
	# Panggil fungsi untuk mengisi data ke UI saat scene siap
	update_display()

func update_display():
	"""Fungsi untuk mengisi semua elemen UI dengan data dari variabel export."""
	

func set_button_disabled(disabled: bool):
	"""Fungsi untuk mengaktifkan/menonaktifkan tombol."""
	

func _on_action_button_pressed():
	# Saat tombol ditekan, emit sinyal kustom
	# Scene utama akan menangkap sinyal ini
	emit_signal("action_pressed")
