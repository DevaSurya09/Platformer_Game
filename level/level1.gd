extends Node2D


onready var heartContainer = $CanvasLayer/Control/hearts
signal player_dead
signal player_entered

var door = true

func _ready():
	$CanvasLayer/AnimationPlayer.play("fade")
	if door == true:
		$AnimationPlayer.play("door_enter")
		door = false
	heartContainer.apply_heart($Player.max_damage_count)
	heartContainer.updateHearts($Player.damage_count)
	$Player.connect("player_healt", heartContainer, "updateHearts")
	


func _on_Player_key(value):
	$CanvasLayer/key/Label.text = String(value)
