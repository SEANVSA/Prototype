extends Node

static func format_number(n: float) -> String:
	if n >= 1_000_000_000_000:
		# ran for every number <n> greater or equal to a trillion
		var i:float = snapped(float(n)/1_000_000_000_000, .01)
		return str(i).replace(",", ".") + "B"
	elif n >= 1_000_000:
		# ran for every number <n> smaller than 1 trillion BUT
		# still greater or equal to 1 million
		var i:float = snapped(float(n)/1_000_000, .01)
		return str(i).replace(",", ".") + "M"
	elif n >= 1_000:
		# ran for every number <n> smaller than 1 million BUT
		# still greater or equal to 1 thousand
		var i:float = snapped(float(n)/1_000, .01)
		return str(i).replace(",", ".") + "k"
	else:
		var i:float = snapped(float(n), .01)
		if i == n:
			return str(int(n))
		return str(i).replace(",", ".")

static func format_percent(n: float) -> String:
	var i: int = n*100
	return str(i)+"%"
