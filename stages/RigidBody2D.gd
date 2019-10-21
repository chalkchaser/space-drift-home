extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var life = 8
var wait_time = 0.5 #time before jump
var jump_duration_time = 0.834
var timer
var jump_duration_timer
var idle_timer
var can_jump = false
var direction
var vector_to_reach
var velocity = Vector2(0,0)
var before_jump_time = 2# waiting time before jump
# Called when the node enters the scene tree for the first time.
func _ready():
	direction = Vector2(0,0)
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(wait_time)
	timer.connect("timeout",self,"_jump")
	add_child(timer)
	print("added timer")

	
	jump_duration_timer = Timer.new()
	jump_duration_timer.set_one_shot(true)
	jump_duration_timer.set_wait_time(jump_duration_time)
	jump_duration_timer.connect("timeout",self,"_stop_jump")
	add_child(jump_duration_timer)
	print("added timer")
	#timer.start()
	
	idle_timer = Timer.new()
	idle_timer.set_one_shot(true)
	idle_timer.set_wait_time(before_jump_time)
	idle_timer.connect("timeout",self,"_idle")
	add_child(idle_timer)
	print("added timer")
	#timer.start()
	_stop_jump()

func _idle():
	#move_and_slide(direction,Vector2(0,0),false,4,0.785398,false)
	get_node("AnimatedSprite").play("jumping")
	timer.start()

func _jump():

	#vector_to_reach = (direction*  2000) #this is the distance
	#apply_impulse(Vector2(0,0),vector_to_reach)
	#move_and_slide(vector_to_reach,Vector2(0,0),false,4,0.785398,false)
	can_jump = true
	velocity = direction * 200
	jump_duration_timer.start()
	
func _stop_jump():

	can_jump = false
	get_node("AnimatedSprite").play("idle")
	idle_timer.start()

func _is_hit():
	life -= 1
	print(life)
	if (life <= 0):
		queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):		
	direction = ((get_parent().get_node("Player").get_node("Shadow").get_global_position() - get_parent().get_node("Slime").get_global_position()  ).normalized())
	if(can_jump == true):
		velocity = lerp(velocity,Vector2(0,0),0.05)
		move_and_slide(velocity,direction *4,false,4,0.785398,false)
	else:	
		velocity = direction *4 #walk speed
		move_and_slide(velocity,Vector2(0,0),false,4,0.785398,false)
		
		
	
	
#	pass
