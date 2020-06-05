extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var move = Vector2(0,-1)
var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var gravity = 0.08
var fallspeed = - 0.8


func move():
	move_and_slide(move*speed,Vector2(0,0),false,4,0.785398,false)
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("enemies"):
			if(index == 0): #prevents multiple hits
				collision.collider._is_hit()
		queue_free()
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move()
	if(get_node("shadow/projectile").position.y >= 0):
		get_node("shadow/projectile").position.y = 0
		move = Vector2(0,0)
	else:
		get_node("shadow/projectile").position.y = get_node("shadow/projectile").position.y + fallspeed
		fallspeed = fallspeed + gravity	

		
