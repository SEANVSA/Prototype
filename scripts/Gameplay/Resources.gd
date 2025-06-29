class_name Resources

var gold:int = 0

func _init(_gold:int):
	gold = _gold

func addGold(amount:int):
	gold += amount

func spendGold(amount:int):
	if gold >= amount:
		gold -= amount
