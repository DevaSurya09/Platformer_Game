extends HBoxContainer

var lenght = 3

onready var heartClass = preload("res://component/heart.tscn")
func _ready():
	pass # Replace with function body.


func apply_heart(maxs):
	for i in range(maxs):
		var heart = heartClass.instance()
		add_child(heart)

func updateHearts(current):
	var hearts = get_children()
	if lenght == 3:
		lenght -=1
		for i in range(current):
			hearts[i].updateHeart(true)
		
		for i in range(current, hearts.size()):
			hearts[i].updateHeart(true)
	else:
		for i in range(current):
			hearts[i].updateHeart(true)
		
		for i in range(current, hearts.size()):
			hearts[i].updateHeart(false)
