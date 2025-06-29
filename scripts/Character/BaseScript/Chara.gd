class_name Chara extends RefCounted
var name:String = "Unnamed"
var damage:Big 

func _init(_name: String = "Unnamed", _damage: Big = Big.new(0.0)):
	name = _name
	damage = _damage
