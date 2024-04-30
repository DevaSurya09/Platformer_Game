extends KinematicBody2D

#particle
var particle = preload("res://component/particle_char.tscn")
#jump
export var JUMP = -310
export var JUMP_RELEASE = -120
var JUMP_COUNT = 0
var JUMP_FLOOR = 1

#walk
export var SPEED = 110
export var DODGE = 600
export var ACCELERATION = 100
export var FRICTION = 15
#var CHANGE = SPEED

#dodge
var is_dodging = false
#var dodge_cooldown = 0.5
#var dodge_timer = 0

#fall
export var GRAVITY = 12
export var ADD_FALL_GRAVITY = 4

#healt
var get_damage = false
var damage_count = 0
var max_damage_count = 3

#attack
var attack = false
var direction = 1

#entered
var entered = false
var inin = true
var off_velocity = false
var c_entered = 1

#key
var key = 0

#signal
signal player_healt(value)
signal key(value)

var movement_enabled = true

var velocity = Vector2.ZERO

func _physics_process(delta):
	var character_y = global_position.y
	apply_gravity()
#	if inin == true:
#		velocity.x =0
#		velocity.y =0
#		$AnimatedSprite.play("doorOut")
#		yield(get_tree().create_timer(0.5), "timeout")
#		inin = false
	reload_game(character_y)
	if not get_damage:
		if attack == false:
			logic(delta)
		if attack and entered == false:
			$AnimatedSprite.play("Attack")
			
			attack = true
#			if is_on_floor():
			velocity.x = 0
			$Area2D/CollisionShape2D.disabled = false
#		if attack and entered == true:
#			velocity.x = 0
#	if attack:
#		$AnimatedSprite.animation = "Attack1"
#		attack_timer += delta
#		if attack_timer >= attack_cooldown:
#			$AnimatedSprite.animation = "Attack2"
#			attack = false
#			attack_timer = 0
	var flor = velocity.y
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if velocity.y - flor < -GRAVITY:
		$fall.play()
		apply_particle("fall")

func logic(delt):
	var input = Vector2.ZERO
	input.x = Input.get_axis("ui_left", "ui_right")
#	if is_dodging:
#		dodge_timer += delt
#		if dodge_timer >= dodge_cooldown:
#			is_dodging = false
#			CHANGE = SPEED
#			dodge_timer = 0
	if inin == true:
		velocity.x =0
		velocity.y =0
		$AnimatedSprite.play("doorOut")
		yield(get_tree().create_timer(1), "timeout")
		inin = false
	if input.x == 0:
		apply_friction()
		$AnimatedSprite.animation = "Idle"
	else:
#		if Input.is_action_just_pressed("dodge") and not is_dodging:
#			pass
##			$AnimatedSprite.animation = "Dodge"
##			apply_dodge()
#		else:	
		apply_acceleration(input.x)

		if input.x > 0:
			$AnimatedSprite.flip_h = false
			$AnimatedSprite.position.x = 0
			$Area2D/CollisionShape2D.position.x = 13
		if input.x < 0:
			$AnimatedSprite.flip_h = true
			$AnimatedSprite.position.x = -15
			$Area2D/CollisionShape2D.position.x = -28
		$AnimatedSprite.animation = "Run"
	
	aply_jump()

#	if entered == true:
#		velocity.x = 0

	if entered == true:
		if Input.is_action_just_pressed("attack") and c_entered > 0:
			get_parent().emit_signal("player_entered")
			$win.play()
			c_entered -= 1
			yield(get_tree().create_timer(0.5), "timeout")
		if c_entered <1 and off_velocity == true:
			velocity.x = 0
			velocity.y = 0
	
	if Input.is_action_just_pressed("attack") and not attack and entered == false and c_entered > 0:
		$attack.play()
		attack = true
		
	
func aply_jump():
	if is_on_floor():
		JUMP_COUNT = JUMP_FLOOR
		if Input.is_action_just_pressed("ui_up") and c_entered > 0:
#			if particle.instance().flip_h == true:
#				particle.instance().offset.x = -100
#			else:
#				particle.instance().offset.x = 100
			apply_particle("jump")
			$jump.play()
			velocity.y = JUMP
			
	else:
		$AnimatedSprite.animation = "Jump"
		if Input.is_action_just_released("ui_up") and velocity.y < -100:
			velocity.y = JUMP_RELEASE

		if Input.is_action_just_pressed("ui_up") and JUMP_COUNT > 0 and c_entered > 0:
			$jump.play()
			velocity.y = JUMP
			JUMP_COUNT -= 1

		if velocity.y > 0:
			velocity.y += ADD_FALL_GRAVITY
			$AnimatedSprite.animation = "Fall"

func apply_gravity():
	velocity.y += GRAVITY
	velocity.y = min(velocity.y, 350)

func apply_friction():
	velocity.x = move_toward(velocity.x, 0, FRICTION)

func apply_acceleration(amount):
	velocity.x = move_toward(velocity.x, SPEED * amount, ACCELERATION)

#func apply_dodge():
#	is_dodging = true
#	CHANGE = DODGE
#	dodge_timer = 0
#	$Timer.start()

#func _on_Timer_timeout():
#	CHANGE = SPEED
	
func reload_game(character_y):
	pass
#	if character_y >= 650:
#		get_tree().reload_current_scene()

func get_damage():
	$hit.play()
	var input = Vector2.ZERO
	input.x = Input.get_axis("ui_left", "ui_right")
	if damage_count < max_damage_count:
		max_damage_count -= 1
		get_damage = true
		emit_signal("player_healt", max_damage_count)
		if input.x >= 0:
			velocity.x -= 120
		elif input.x <= 0:
			velocity.x += 120
		$AnimatedSprite.play("Get_damage")
		yield(get_tree().create_timer(0.1), "timeout")
		if max_damage_count == 0:
			velocity.x = 0
			dead()
		else:
			get_damage = false

func dead():
	set_collision_layer_bit(0, false)
	set_collision_mask_bit(2, false)
	$AnimatedSprite.play("Dead")
	yield(get_tree().create_timer(1), "timeout")
	$lose.play()
	
	get_parent().emit_signal("player_dead")
#	get_tree().reload_current_scene()

func _on_AnimatedSprite_animation_finished():
	$Area2D/CollisionShape2D.disabled = true
	attack = false
	inin = false


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		entered = true


func _on_Area2D_body_exited(body):
	if body.name == "Player":
		entered = false


func _on_off_char_body_entered(body):
	if body.name == "Player":
		off_velocity = true

func apply_particle(animated):
	var part = particle.instance()
	part.play(animated)
	part.flip_h = $AnimatedSprite.flip_h
	if part.flip_h == false:
		part.offset.x = -6
	else:
		part.offset.x = -8
	part.global_position = global_position
	get_tree().current_scene.add_child(part)


func _on_AnimatedSprite_frame_changed():
	if $AnimatedSprite.animation == "Run" and ($AnimatedSprite.frame == 0 or $AnimatedSprite.frame == 4):
		apply_particle("run")


func take_key():
	key +=1
	emit_signal("key",key)
