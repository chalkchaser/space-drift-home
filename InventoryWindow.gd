extends Sprite

var is_open

func _ready():
	hide()

func _process(delta):
	if(Input.is_action_just_pressed("ui_inventory")):
		if(is_visible()):
			hide()
		else:
			show()	
			get_node("ItemList").select(0)	
			get_node("ItemList").grab_focus()
			
	if(is_visible()):
		is_open = true
	else:
		is_open = false	

