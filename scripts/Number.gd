extends Node

static func format_percent(n: Big) -> String:
	var i: Big = n.multiply(100)
	return i.toString()+"%"
