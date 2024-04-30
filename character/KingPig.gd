extends KinematicBody2D

var direction = 1
var velocity = Vector2.ZERO

var health = 10
var get_hit = false

func _physics_process(delta):
	velocity.y += 8
	
	if is_on_wall():
#	or not $Node2D/RayCast2D.is_colliding():
		direction *= -1
#		$Node2D.scale.x *= -1
	
	velocity.x = 10 * direction
	
	if not get_hit:
		velocity = move_and_slide(velocity, Vector2.UP)
		animated()
	
func animated():
	if is_on_floor():
		$AnimatedSprite.play("Walk")
	else:
		# $AnimatedSprite.play("fall")
		pass
		
	if direction == -1:
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.position.x = 0
	else:
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.position.x = 1

func apply_gravity():
	velocity.y += 8
	velocity.y = min(velocity.y, 350)


func get_damage():
	health -= 1
	get_hit = true
	$AnimatedSprite.play("get_hit")
	yield(get_tree().create_timer(0.2), "timeout")
	if health <= 0:
		$AnimatedSprite.position.y = $AnimatedSprite.position.y + 4
		dead()
	else:
		get_hit = false

func dead():
	set_collision_layer_bit(2, false)
	set_collision_mask_bit(0, false)
	$Area2D.set_collision_layer_bit(2, false)
	$Area2D.set_collision_mask_bit(0, false)
	$AnimatedSprite.play("dead")
	$AnimationPlayer.play("fade")
	yield(get_tree().create_timer(1), "timeout")
	queue_free()

func _on_Area2D_area_entered(area):
	if area.is_in_group("hammer"):
		get_damage()


func _on_Area2D_body_entered(body):
	print("Body entered:", body)
	if body.name == 'Player':
		body.get_damage()
