extends KinematicBody2D


var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity.y += 8
	
	
	

	velocity = move_and_slide(velocity, Vector2.UP)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.name == 'Player':
		$AnimatedSprite.play("on")
		yield(get_tree().create_timer(0.2),"timeout")
		$AudioStreamPlayer2D.play()
		$AnimatedSprite.play("boom")
		$AnimationPlayer.play("fade_out")
		yield(get_tree().create_timer(0.2),"timeout")
		$Area2D2/CollisionShape2D.disabled = false
		yield(get_tree().create_timer(0.8),"timeout")
		queue_free()


func _on_Area2D2_body_entered(body):
	if body.name == 'Player':
		body.get_damage()
