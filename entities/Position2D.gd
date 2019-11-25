extends Position2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player_position
var distance_to_player = 14
var past_position
#var weapon = preload("res://weapons/Shotgun.tscn")
#var weapon_2 = preload("res://weapons/Handgun.tscn")



func _ready():		
	switch_weapon(0)
	
	#self.add_child(Inventory.get_child(1))
	#add_child(Inventory.ge)
	
func switch_weapon(index):
	var current = get_child(0)
	if(current != null):
		current.set_process(false)

	
	var temp = Inventory.get_child(index)
	Inventory.remove_child(temp)
	add_child(temp)
	temp.set_process(true)
	
	remove_child(current)
	Inventory.add_child(current)
	Interface.get_node("InventoryWindow").get_node("ItemList").refresh()
	
func set_distance_to_player(distance):
	distance_to_player = distance
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(!Interface.get_node("InventoryWindow").is_open):
		player_position = get_parent().get_global_position() 
		position =(get_parent().get_global_mouse_position() - player_position).normalized() *distance_to_player

