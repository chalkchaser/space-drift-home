extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var timer = null
var time_to_live = 1
var alive = true
var move = Vector2(0,0) #direction
var speed = 40


# Called when the node enters the scene tree for the first time.
func _ready():
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(time_to_live)
	timer.connect("timeout",self,"_on_time_out_complete")
	add_child(timer)
	timer.start()
	pass # Replace with function body.

func _on_time_out_complete():
	alive = false
	
func _set_move(vec):
	move = vec

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_slide(move*speed,Vector2(0,0),false,4,0.785398,false)
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("enemies"):
			print("taths an enemy")
			if(index == 0): #prevents multiple hits
				collision.collider._is_hit()
		queue_free()
	# collision_info:
		#print(collision_info)
		#queue_free()
	
	
	
