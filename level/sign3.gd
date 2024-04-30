extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
#	Glob.unlock = 2
	pass


func _on_Button4_pressed():
	if Glob.unlock ==3:
		Glob.unlock +=1
	get_tree().change_scene("res://level/level4.tscn")
