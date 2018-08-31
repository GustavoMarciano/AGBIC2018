extends "res://Character/DefaultCharacter.gd"

func _ready():
	var weapon = Tools.create_object(load("res://Model/Gears/CrossBow/CrossBow.tscn"),$"GearAnchor")
	weapon.connect("attack_finished", self, "_on_Weapon_attack_finished")
	gear = weapon