extends Node

export (float) var animation_speed

func start():
	owner.change_animation("Move",animation_speed)

func update(delta):
	owner.motion.x = owner.dir.x * owner.speed
	owner.motion.y = owner.dir.y * owner.speed
	if owner.dir == Vector2(0,0):
		exit()

func exit():
	owner.change_state("Idle")