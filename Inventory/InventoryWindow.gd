extends Sprite

var is_open
var currently_selected = 0

func _ready():
	hide()

func _process(delta):
	if(Input.is_action_just_pressed("ui_inventory")):
		if(is_visible()):
			hide()
			currently_selected = get_node("ItemList").get_selected_items()[0]
		else:
			show()	
			get_node("ItemList").select(currently_selected)	
			get_node("ItemList").grab_focus()
			
	if(is_visible()):
		is_open = true
	else:
		is_open = false	
	
	
func refresh():
	get_node("ItemList").refresh()


func _on_ItemList_item_activated(index):
	get_tree().get_root().get_child(2).get_node("Player").switch_weapon(index)
	currently_selected = index
	get_node("ItemList").select(currently_selected)