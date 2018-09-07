extends "res://Character/DefaultCharacter.gd"

var target 
var target_list = []
var wr
var random

func _process(delta):
	randomize()
	var unity_list = get_tree().get_nodes_in_group("UNITY")

	for unity in unity_list:
		if unity.side != self.side && !target_list.has(unity):
			target_list.append(unity)

	if !target && target_list.size() > 0:
		random = randi() % target_list.size()
		target = target_list[random]
		wr = weakref(target)

     #check if the target exist
	if !wr.get_ref() && target_list.size() > 0:
		target_list.remove(random)
		target = null
		return

     #check if the target istill in a oposit side
	if target:
		if target.side == self.side:
			target_list.remove(random)
			target = null
			return