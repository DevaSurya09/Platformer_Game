extends KinematicBody2D


var gravity = 325
#var gravity = 100
#var fall = false
var velocity = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	
	velocity = move_and_slide(velocity, Vector2.UP)
#	velocity.y += 8
#	pass
		
	
#	velocity = move_and_slide(velocity, Vector2.UP)



func _on_Area2D_body_entered(body):
	if body.name == "Player":
		body.get_damage()
		body.velocity.y = -200
		print("ughh..")
#	else:
#		body.get_damage()
#	elif is_on_floor():
#		$AnimationPlayer.play("fade_out")
#		$Area2D.set_collision_layer_bit(6, false)
#		$Area2D.set_collision_mask_bit(0, false)
#		set_collision_layer_bit(6, false)
#		set_collision_mask_bit(0, false)
#		yield(get_tree().create_timer(0.5),"timeout")
#		queue_free()
##	elif (is_on_ceiling() or is_on_wall() ):
	elif body.name == "enemy" or body.name == "enemy1" or body.name == "enemy2" or body.name == "enemy" or body.name == "enemy":
		body.get_damage()
#		pass
	else:
		$AnimationPlayer.play("fade_out")
		$Area2D.set_collision_layer_bit(6, false)
		$Area2D.set_collision_mask_bit(0, false)
		set_collision_layer_bit(6, false)
		set_collision_mask_bit(0, false)
		yield(get_tree().create_timer(0.5),"timeout")
		queue_free()
		


func _on_Area2D2_body_entered(body):
	if body.name == "Player":
#		fall = true
		velocity.y += gravity
#		velocity = move_and_slide(velocity, Vector2.UP)
#		if Input.is_action_pressed("ui_right"):
#			velocity.x = 30 
#		print(fall)
