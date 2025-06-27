class_name Boss extends Enemy

var timer:Timer

func _init(_name:String, _max_hp:int):
	super._init(_name,_max_hp)
	timer.wait_time = 30.0
