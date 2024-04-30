extends Panel

func _ready():
	pass # Replace with function body.


func updateHeart(whole: bool):
	if whole: 
#		$AnimatedSprite.visible = true
		$Sprite.visible =true
	else:
#		$AnimatedSprite.visible = false
		$Sprite.visible =false
