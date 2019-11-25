extends "res://Item.gd"

#default Weapon
var shot_speed = 6 #default 
var player_position
onready var bullet = load("res://entities/Bullet.tscn")#delta

var delay_timer = null
var shoot_delay = 0.2 #in seconds
var can_shoot = true
var direction
var muzzle_timer = null
var muzzle_time = 0.02
var size_to_grow_to #used lerping the image
var shake_amount = 0

#TODO energy usage
func _ready():
	#set_process(false)
	size_to_grow_to = Vector2(1,1)
	delay_timer = Timer.new()
	delay_timer.set_one_shot(true)
	delay_timer.set_wait_time(shoot_delay)
	delay_timer.connect("timeout",self,"_on_time_out_complete")
	add_child(delay_timer)
	
	muzzle_timer = Timer.new()
	muzzle_timer.set_one_shot(true)
	muzzle_timer.set_wait_time(muzzle_time)
	muzzle_timer.connect("timeout",self,"_on_time_out_muzzle")
	add_child(muzzle_timer)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
    	
func _process(delta):
	#player_position = get_parent().get_position()
	if(!Interface.get_node("InventoryWindow").is_open):
		if Input.is_action_pressed("ui_left_mouse_click"):
			_shoot()
		get_node("Sprite").position = get_parent().get_global_position()
		#get_node("Sprite").look_at(get_parent().get_global_mouse_position())
		if get_parent().get_parent().has_method("get_global_position"):
			var player_xy =get_parent().get_parent().get_global_position()
			var cursor_xy = get_parent().get_global_mouse_position()
			var player_to_cursor =    cursor_xy - player_xy 
			var base_vector = Vector2(1,0)
			var cosinus = (player_to_cursor.x * base_vector.x + player_to_cursor.y * base_vector.y) / (sqrt(pow(player_to_cursor.x,2) + pow(player_to_cursor.y,2)))
			if(cursor_xy.y > player_xy.y):
				get_node("Sprite").rotation = (acos( cosinus)) 
				get_node("Sprite").z_index = 2
			else: 
				get_node("Sprite").rotation = -(acos(cosinus)) 
				get_node("Sprite").z_index = 0
			#get_node("Sprite").flip_h = true
			get_node("Sprite").flip_v = get_parent().get_parent().flipped
			get_node("Sprite").scale = (get_node("Sprite").get_scale()).linear_interpolate(size_to_grow_to, 0.05)
			
			
		


	
func _on_time_out_complete():
	can_shoot = true

func _on_time_out_muzzle():
	get_node("muzzle").visible = false

func _shoot():
	if(can_shoot ):
		#get_parent().get_parent().get_parent().get_node("CameraObject")._shake(0)
		var new_bullet = bullet.instance()
		var stage = get_parent().get_parent().get_parent()
		stage.add_child(new_bullet)
		new_bullet.position = stage.get_node("Player").get_node("WeaponPosition").get_global_position()
		var current_player_pos = get_parent().get_parent().get_global_position()
		direction = (get_parent().get_global_mouse_position()-current_player_pos).normalized()
		direction = direction.rotated(rand_range(-0.0,0.0))
		new_bullet._set_move(direction * shot_speed)
		get_parent().get_parent().position = get_parent().get_parent().position  - direction * 0.25 #moves the player back against direction of shot in pixeö
		can_shoot = false
		delay_timer.start()
		get_node("muzzle").position = get_parent().get_global_position()
		get_node("muzzle").visible = true
		muzzle_timer.start()
		get_node("AudioStreamPlayer").play()
		get_parent().get_parent().get_node("AnimatedSprite").scale = Vector2(0.98 , 1)
		
		get_node("Sprite").scale = Vector2(1.1 , 0.9) #squashes the sprite when shooting
		
		
		
		
		