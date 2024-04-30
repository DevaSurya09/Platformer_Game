extends Area2D

var key = false


# Called when the node enters the scene tree for the first time.
func _ready():
	if key == false:
		call_deferred("disabled")
#		$CollisionShape2D.disabled = true
#	else:
	


func _on_key_body_entered(body):
	key = true
	if body.name == 'Player':
		call_deferred("enable")


func enable():
	$CollisionShape2D.disabled = false
	
func disabled():
	$CollisionShape2D.disabled = true
