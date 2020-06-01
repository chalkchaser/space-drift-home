extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#get_tree().change_scene("res://spaceview/SpaceView.tscn")
	pass
	
func switch_to_stage(stage_name):
	var path = "res://stages/" + str(stage_name.lstrip("stage "))+ ".tscn"
	get_tree().change_scene(path)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
func return_to_spaceview():
	get_tree().change_scene("res://spaceview/SpaceView.tscn")
