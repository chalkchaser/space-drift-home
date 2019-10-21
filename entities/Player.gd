extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 100
var screen_size_x = 180
var screen_size_y = 320
var flipped = false 
var size_to_grow_to 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	size_to_grow_to = Vector2(1,1)
	_restore_size(delta)

	var velocity = Vector2()
	flipped = get_global_mouse_position().x < position.x
	
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		
	$AnimatedSprite.flip_h = (flipped)	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed	
		
		if(!flipped and velocity.x < 0):
			$AnimatedSprite.play("walking_back")
		elif(flipped and velocity.x > 0):	
			$AnimatedSprite.play("walking_back")
		else:$AnimatedSprite.play("walking_right")
	else: $AnimatedSprite.play("right_facing")
	move_and_slide(velocity,Vector2(0,0),false,4,0.785398,false)

	
		

func _restore_size(delta):
	get_node("AnimatedSprite").scale = (get_node("AnimatedSprite").get_scale()).linear_interpolate(size_to_grow_to, 0.05)
		
	
