extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var parent = null
var left = null
var right = null
var center = Vector2()
var size = Vector2()
var start = Vector2()#(0,0) starting point
var cut_vert = null #if the cut is vertical
# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent() # Replace with function body.

func add_node(node):
	if(left != null):
		self.add_child(node)
		left = node
	elif(right != null):
		self.add_child(node)
		right = node
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
