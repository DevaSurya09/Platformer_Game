extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("fade in")
	yield(get_tree().create_timer(5), "timeout")
	get_tree().change_scene("res://level/title.tscn")
