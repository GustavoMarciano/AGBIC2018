extends KinematicBody2D

var dir = Vector2()
var current_state = ""
var motion = Vector2()
var gear = null

export (String) var side
export (float) var speed 
export (float) var buff_move_speed 
export (float) var buff_attack_speed 

func _ready():
	change_state("Idle")

func _physics_process(delta):
	current_state.update(delta)
	motion = move_and_slide(motion).normalized()

func change_state(state):
	var path = "State/" + state
	if get_node(path):
		current_state = get_node(path)
		current_state.start()
	else:
		print("invalid state")

func change_animation(anim_name,anim_speed):
	var sprite = get_node("Sprite")
	sprite.anim = anim_name
	sprite.anim_speed = anim_speed