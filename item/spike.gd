extends Area2D

func _ready():
	pass # Replace with function body.




func _on_Area2D_body_entered(body):
	if body.name == "Player":
		body.get_damage()
		body.velocity.y = -200
		print("ughh..")
