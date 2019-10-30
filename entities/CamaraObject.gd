extends Node2D

var mouse_position
onready var player = get_parent().get_node("Player")
var x_to_reach
var y_to_reach
var vector_to_reach

func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mouse_position = get_global_mouse_position() 
	x_to_reach = (3*player.position.x + mouse_position.x)/4 -155 #not exact
	y_to_reach = (3*player.position.y + mouse_position.y)/4-70  #values
	vector_to_reach = Vector2(x_to_reach,y_to_reach)
	position = position.linear_interpolate(vector_to_reach,0.2)
#TODO add camera lag lerp