extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 100
var screen_size_x = 180
var screen_size_y = 320
var flipped = false 
var size_to_grow_to 
var life = 5
var invincibility_timer
var invincibility_time   = 1.2
var invincible = false
# Called when the node enters the scene tree for the first time.
func _ready():
	invincibility_timer = Timer.new()
	invincibility_timer.set_one_shot(true)
	invincibility_timer.set_wait_time(invincibility_time)
	invincibility_timer.connect("timeout",self,"_stop_invincibility")
	add_child(invincibility_timer)
	invincibility_timer.start()
	

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
	
	if(invincible):
		self.modulate.a = 0.4 if (Engine.get_frames_drawn() / 8) % 2 == 0 else 1.0
	else:
        self.modulate.a = 1.0


func _is_hit():
	if(not invincible):
		life = life - 1	
		print(life)
	invincibility_timer.start()
	invincible = true

func _stop_invincibility():
	invincible = false
		

func _restore_size(delta):
	get_node("AnimatedSprite").scale = (get_node("AnimatedSprite").get_scale()).linear_interpolate(size_to_grow_to, 0.05)
	if(invincible):
		pass
	else: 
		get_node("AnimatedSprite").show()
	
