extends Node2D

var mouse_position
onready var player = get_parent().get_node("Player")
var x_to_reach
var y_to_reach
var vector_to_reach
var shake_amount = 1.0
var shake = false
var timer

func _ready():
	timer = Timer.new()
	timer.set_one_shot(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mouse_position = get_global_mouse_position() 
	x_to_reach = (3*player.position.x + mouse_position.x)/4 -155 #not exact
	y_to_reach = (3*player.position.y + mouse_position.y)/4-70  #values
	vector_to_reach = Vector2(x_to_reach,y_to_reach)
	position = position.linear_interpolate(vector_to_reach,0.2)
	
	
	if(shake == true):
		get_node("Camera2D").set_offset(Vector2( 
	    rand_range(-1.0, 1.0) * shake_amount, 
	    rand_range(- 1.0, 1.0) * shake_amount))	


func _shake(time):
	
	timer.set_wait_time(time)
	timer.connect("timeout",self,"_stop_shake")
	add_child(timer)
	timer.start()
	shake = true
	
#TODO add camera lag lerp
func _stop_shake():
	shake = false
	get_node("Camera2D").set_offset(Vector2(0,0))
