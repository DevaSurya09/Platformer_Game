extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("fade in")
	yield(get_tree().create_timer(1.6),"timeout")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	$AnimationPlayer.play_backwards("fade in")
	$btn.play()
	yield(get_tree().create_timer(1.6),"timeout")
	get_tree().change_scene("res://level/level1.tscn")


func _on_Button2_pressed():
	$AnimationPlayer.play_backwards("fade in")
	$btn.play()
	yield(get_tree().create_timer(1.6),"timeout")
	get_tree().change_scene("res://level/level.tscn")


func _on_Button3_pressed():
	$AnimationPlayer.play_backwards("fade in")
	$btn.play()
	yield(get_tree().create_timer(1.6),"timeout")
	get_tree().quit()


