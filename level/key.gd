extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
#	queue_free()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_key_body_entered(body):
	if body.name == "Player":
		$key.play()
		body.take_key()
		$AnimationPlayer.play("key")
		yield(get_tree().create_timer(1.5),"timeout")
	queue_free()
