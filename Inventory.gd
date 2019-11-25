extends Node2D

func _ready():
	var children = get_children()
	for item in children:
		item.set_process(false)
