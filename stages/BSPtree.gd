extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var root = get_node("BSPnode")
onready var node_list = [root]
var bspnode = preload("res://BSPnode.gd")

var matrix = []
var width = 6
var height = 12
	
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	
	#for y in range(height):
	#	matrix.append([])
	#	matrix[y]=[]        
	#	for x in range(width):
	#		matrix[y].append([])
	#		matrix[y][x]=0
	
	
	root.center =  Vector2(width/2,height/2)
	root.size = Vector2(width,height)
	root.start = root.center - root.size/2
	print(root.center)
	print(root.size)
	print(root.start)
	
	var node = bspnode.new()
	if(randi() % 2 == 0):#cut vertically
		root.center =  Vector2(width/2,height/2)
		root.cut_vert = true
	else: #cut horizontally

		root.cut_vert = false


	
	
	root.add_node(node) # uses own function

	#print_matrix()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func print_matrix():
	for y in matrix:
		print(y)
