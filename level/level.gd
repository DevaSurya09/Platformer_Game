extends Control
var number = 1
func _ready():
	for i in range($GridContainer.get_child_count()):
			Glob.levels.append(i+1)
	
	
	for level in $GridContainer.get_children():
		# Convert level.name to int for comparison
#		var level_number = int(level.name)+1
		if int(level.name) <= Glob.unlock:
			# Enable the button
			level.set_disabled(false)
#			level.connect('pressed', self, 'change_level', [level_number])
		else:
			# Disable the button
			level.set_disabled(true)
	$AnimationPlayer.play("fade in")
	yield(get_tree().create_timer(1.6), "timeout")
	
			
			
#func change_level(lvl_no):
##	print("Changing level to: res://level/level" + lvl_no + ".tscn")
#	get_tree().change_scene("res://level/level"+str(lvl_no)+".tscn")
			
#	print(range(Glob.unlock+1))
func _on_Button6_pressed():
	$AnimationPlayer.play_backwards("fade in")
	$btn.play()
	yield(get_tree().create_timer(1.6), "timeout")
	get_tree().change_scene("res://level/title.tscn")
	
	
func _on_Button_pressed():
	$AnimationPlayer.play_backwards("fade in")
	$btn.play()
	yield(get_tree().create_timer(1.6), "timeout")
	get_tree().change_scene("res://level/level1.tscn")


func _on_Button2_pressed():
	$AnimationPlayer.play_backwards("fade in")
	$btn.play()
	yield(get_tree().create_timer(1.6), "timeout")
	get_tree().change_scene("res://level/level2.tscn")


func _on_Button3_pressed():
	$AnimationPlayer.play_backwards("fade in")
	$btn.play()
	yield(get_tree().create_timer(1.6), "timeout")
	get_tree().change_scene("res://level/level3.tscn")


func _on_Button4_pressed():
	$AnimationPlayer.play_backwards("fade in")
	$btn.play()
	yield(get_tree().create_timer(1.6), "timeout")
	get_tree().change_scene("res://level/level4.tscn")
