extends KinematicBody2D

var velocity = Vector2.ZERO
func _physics_process(delta):
	velocity.y += 8
	
	
	

	velocity = move_and_slide(velocity, Vector2.UP)

func get_damage():
	pass

func _on_Area2D_body_entered(body):
	if body.name == 'Player':
		if Input.is_action_pressed("ui_right"):
			velocity.x = 30 
		if Input.is_action_pressed("ui_left"):
			velocity.x = -30
		
		


func _on_Area2D_body_exited(body):
	if body.name == 'Player':
		velocity.x = 0 
