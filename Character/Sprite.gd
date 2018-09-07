extends Sprite

onready var anim_player = get_node("Animation/AnimationPlayer")
var anim = ""
var anim_new = ""
var anim_speed = 0
var anim_blend = 0


func _process(delta):
	if get_global_mouse_position().x > owner.position.x:
		set_scale(Vector2(1,1))
	else:
		set_scale(Vector2(-1,1))

	if anim != anim_new:
		anim_new = anim
		anim_player.play(anim,anim_blend,anim_speed)