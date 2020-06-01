extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var exit_condition_fullfilled = true
# Called when the node enters the scene tree for the first time.
func _ready():
	BackgroundMusic.change_to("Staircase.ogg")

	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_pressed("ui_accept")):
		MetaLogic.return_to_spaceview()
#	pass
