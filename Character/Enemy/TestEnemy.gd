extends "res://characters/default_character/Movement.gd"

var target = null

func _ready():
	#initializing object variables and state
	$"Status".set_state("IDLE")
	$"Status".set_speed("=",20)
	$"Status".set_total_hp("=",200)
	$"Status".set_hp("=",200)
	pass

func _physics_process(delta):
	match $"Status".get_state():
		"IDLE":
				_on_Vision_area()
				motion.x = 0 
				if $"Status".get_target() != null:
					$"Status".set_state("CHASING")
		"CHASING":
			if weakref($"Status".get_target()).get_ref(): 
				if $"Status".get_target().get_node("Status").get_side() != $"Status".get_side():
					if self.global_position.x != $"Status".get_target().global_position.x:
						direction = ($"Status".get_target().global_position - self.global_position).normalized()
						motion.x = direction.x * $"Status".get_speed()
					else:
						motion.x = 0 
				else:
					 $"Status".set_state("IDLE")
		"DEATH":
			queue_free()
	pass

func _on_Vision_area():
	var bodys = $"Vision".get_overlapping_bodies()

	for body in bodys:
		if body.has_node("Status") && body.get_node("Status").get_side() != $"Status".get_side():
			$"Status".set_target(body)