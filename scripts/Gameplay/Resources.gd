class_name Resources extends Node

signal gold_value_changed
var gold:int = 314000

func addGold(amount:int):
	gold += amount
	emit_signal("gold_value_changed")

func spendGold(amount:int) -> bool:
	if gold >= amount:
		gold -= amount
		emit_signal("gold_value_changed")
		return true
	return false
