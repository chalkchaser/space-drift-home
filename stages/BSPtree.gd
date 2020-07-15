extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var root = get_node("BSPnode")
onready var node_list = [root]
var bspnode = preload("res://BSPnode.gd")

var matrix = []
var width #sync this
var height  #sync this

var number_of_splits = 3
	
# Called when the node enters the scene tree for the first time.
func _ready():
	width = self.get_parent().world_size.x
	height = self.get_parent().world_size.y
	
	randomize()

	root.center =  Vector2(floor(width/2),floor(height/2))
	root.size = Vector2(width,height)
	root.start = root.center - root.size/2

	
	split_for(root, number_of_splits)
	#print_bsp_tree(root)
	var node = bspnode.new()



	
	
	root.add_node(node) # uses own function

func get_leaves():
	var leaf_list = []
	return get_leaves_recursively(root, leaf_list)


func get_leaves_recursively(node, leaf_list):
	for i in node.get_children():
		if i.get_child_count() > 0:
			get_leaves_recursively(i,leaf_list)
		else:
			leaf_list.append(i)		
	return leaf_list		
	
func print_bsp_tree(node):
	for i in node.get_children():
		if i.get_child_count() > 0:
			print(i.size)
			print_bsp_tree(i)
		else:
			print("leaf"+ str(i.size) + "center@ " + str(i.center))	
			
func split_for(root_node, number):
	var nodes_to_split = [root_node]#leaves
	while(number>0):
		var new_nodes_to_split = []
		for node in nodes_to_split:
			split(node)
			new_nodes_to_split.append(node.get_child(0))
			new_nodes_to_split.append(node.get_child(1))
		nodes_to_split = new_nodes_to_split
		number = number - 1

func split(node):
	var center = node.center
	var size = node.size
	var start = node.start
	if(randi() % 2 == 0):#cut vertically
		root.cut_vert = true
		
		#Always round down on left and upper part, else round up
		var left = bspnode.new()
		left.size = Vector2(floor(node.size.x/2),node.size.y)
		left.center = 	node.center - Vector2(ceil(left.size.x/2),0)#reversed
		left.start = node.start
		node.add_child(left)
		
		var right = bspnode.new()
		right.size = Vector2(ceil(node.size.x/2),node.size.y)
		right.center = 	node.center + Vector2(floor(right.size.x/2),0)#reversed
		right.start = node.start + Vector2(left.size.x,0)#already rounded
		node.add_child(right)
		
	else: #cut horizontally
		root.cut_vert = false
		var left = bspnode.new() #left in the tree but up in the map
		left.size = Vector2(node.size.x ,floor(node.size.y/2))
		left.center = 	node.center - Vector2(0, ceil(left.size.y/2))#reversed
		left.start = node.start
		node.add_child(left)
		
		var right = bspnode.new()
		right.size = Vector2(node.size.x ,ceil(node.size.y/2))
		right.center = 	node.center + Vector2(0, floor(right.size.y/2))#reversed
		right.start = node.start + Vector2(0,left.size.y)
		node.add_child(right)

	
	
func print_matrix():
	for y in matrix:
		print(y)
