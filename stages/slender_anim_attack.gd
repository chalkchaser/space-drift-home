extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var gravity = 0.08
var fallspeed = - 0.5
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if(get_node("shadow/projectile").position.y >= 0):
		get_node("shadow/projectile").position.y = 0
	else:
		get_node("shadow/projectile").position.y = get_node("shadow/projectile").position.y + fallspeed
		fallspeed = fallspeed + gravity	
		position.x = position.x +2
		
