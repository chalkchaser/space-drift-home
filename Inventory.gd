extends Node2D

func _ready():
	var children = get_children()
	for item in children:
		item.get_node("Sprite").hide()
		item.set_process(false)
		
