class_name Boss extends Enemy

func _init(_name:String, _max_hp:Big):
	super._init(_name,_max_hp.multiply(10))
