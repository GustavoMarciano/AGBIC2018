extends Node

export (float) var animation_speed

func start():
	owner.change_animation("Idle",animation_speed)

func update(delta):
	if owner.dir != Vector2(0,0):
		exit()

func exit():
	owner.change_state("Move")