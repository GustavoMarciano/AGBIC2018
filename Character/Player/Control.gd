extends Node

func _process(delta):
	var move = Vector2(int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left")),
                       int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))) 

	owner.dir = move
	
	if Input.is_action_just_pressed("ui_accept"):
		owner.queue_free()