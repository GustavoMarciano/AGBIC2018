extends Node
var move = Vector2()

func _process(delta):
	if owner.target != null:
			var target_position = owner.target.global_position
			if target_position.x > owner.global_position.x:
				move.x = 1
			else:
				move.x = -1 
			if target_position.y > owner.global_position.y:
				move.y = 1
			else:
				move.y = -1 

	owner.dir = move