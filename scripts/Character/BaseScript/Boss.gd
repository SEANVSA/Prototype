class_name Boss extends Enemy

var timer:Timer

func _init(_name:String, _max_hp:int):
	super._init(_name,_max_hp*10)
	timer.wait_time = 30.0

func startTimer():
	timer.one_shot = true
	timer.start(30)
