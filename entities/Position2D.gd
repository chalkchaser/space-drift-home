extends Position2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player_position
var distance_to_player = 14
var past_position
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	player_position = get_parent().get_global_position() 
	position =(get_parent().get_global_mouse_position() - player_position).normalized() *distance_to_player

