extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
#	Glob.unlock = 1
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button4_pressed():
	if Glob.unlock ==1:
		Glob.unlock +=1
	$btn.play()
	yield(get_tree().create_timer(0.5),"timeout")
	get_tree().change_scene("res://level/level2.tscn")
