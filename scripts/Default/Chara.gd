class_name Chara extends RefCounted

var name:String = "Unnamed"
var damage:float = 0.0

func _init(_name: String = "Unnamed", _damage: float = 0.0):
	name = _name
	damage = _damage
