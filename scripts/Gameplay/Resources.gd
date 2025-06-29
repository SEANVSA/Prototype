class_name Resources extends Node

signal gold_value_changed
var gold:Big = Big.new(1)

func addGold(amount:Big):
	gold.plusEquals(amount)
	emit_signal("gold_value_changed")

func spendGold(amount:Big) -> bool:
	if gold.isGreaterThan(amount):
		gold.minusEquals(amount)
		emit_signal("gold_value_changed")
		return true
	return false
