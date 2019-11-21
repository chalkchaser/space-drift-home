extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var distance = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	distance = distance +0.00005
	get_node("Position2D").position.x = get_node("Position2D").position.x + distance
#	pass
