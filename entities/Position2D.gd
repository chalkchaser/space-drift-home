extends Position2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player_position
var distance_to_player = 14
var past_position
var z_index_weapon = 2

#var weapon = preload("res://weapons/Shotgun.tscn")
#var weapon_2 = preload("res://weapons/Handgun.tscn")



func _ready():		
	switch_weapon(0)
	
func switch_weapon(index):
	var current = get_child(0)
	if(current != null):
		current.set_process(false)
		current.get_node("Sprite").hide()
	
	var temp = Inventory.get_child(index)
	Inventory.remove_child(temp)
	add_child(temp)
	position = position.normalized()* temp.distance_to_player
	temp.set_process(true)
	
	remove_child(current)
	Inventory.add_child(current)
	Interface.get_node("InventoryWindow").get_node("ItemList").refresh()
	
func set_distance_to_player(distance):
	distance_to_player = distance
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(get_child(0).get_node("Sprite")!= null):
		get_child(0).get_node("Sprite").show()
	get_child(0).get_node("Sprite").z_index = z_index_weapon
	
	if(!Interface.get_node("InventoryWindow").is_open):
		player_position = get_parent().get_global_position() 
		position =(get_parent().get_global_mouse_position() - player_position).normalized()* distance_to_player 
	
		var player_xy =get_parent().get_global_position()
		var cursor_xy = get_global_mouse_position()
		var player_to_cursor =    cursor_xy - player_xy 
		var base_vector = Vector2(1,0)
		var cosinus = (player_to_cursor.x * base_vector.x + player_to_cursor.y * base_vector.y) / (sqrt(pow(player_to_cursor.x,2) + pow(player_to_cursor.y,2)))
		if(cursor_xy.y > player_xy.y):
			rotation = (acos( cosinus)) 
			z_index_weapon = 2
		else: 
			rotation = -(acos(cosinus)) 
			z_index_weapon = 0
