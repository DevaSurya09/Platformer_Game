extends CenterContainer


onready var tween = $Tween
var win_current = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func inPopup():
	tween.interpolate_property(self, "rect_position:y", -128,0,1, Tween.TRANS_ELASTIC,Tween.EASE_OUT)
	tween.start()
	win_current -= 1

func _on_level1_player_entered():
	if win_current == 1:
		inPopup()


func _on_Button4_pressed():
#	Glob.unlock +=1
	pass
#	get_tree().change_scene("res://level/level"+str(Glob.unlock)+".tscn")


func _on_Button5_pressed():
	$btn.play()
	yield(get_tree().create_timer(0.5),"timeout")
	get_tree().change_scene("res://level/level.tscn")


func _on_Button6_pressed():
	$btn.play()
	yield(get_tree().create_timer(0.5),"timeout")
	get_tree().change_scene("res://level/title.tscn")
