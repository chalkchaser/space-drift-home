extends ItemList

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	refresh()
	
func refresh():
	self.clear()
	for item in Inventory.get_children():
		var texture = item.get_node("Sprite").texture
		add_item(item.inventory_name,texture)
	for i in range(0,get_item_count()): # removes tooltips
		set_item_tooltip_enabled(i,false)	
		
