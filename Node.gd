extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var left = null
var right = null
var center_coordinate = null
var matrix = []
var binary_tree = load("res://generation/BinaryTree.tscn")
# Called when the node enters the scene tree for the first time.

func _ready():
	var test_matrix = [[0,1,0,1],[0,1,1,1],[0,1,1,1]]
	var root = binary_tree.instance()
	root.matrix = test_matrix
	root.add_left_child(test_matrix)
	print(test_matrix)
	print(root.get_left_child().center_coordinate)	
	

func add_left_child(matrix):
	var new_node = binary_tree.instance()
	new_node.matrix = matrix
	new_node.center_coordinate = [(len(matrix))/2,(len(matrix[0]))/2]
	left = new_node
	

func add_right_child(matrix):	
	var new_node = binary_tree.instance()
	new_node.matrix = matrix
	right = new_node
	
func get_left_child():
	return left	
	
func get_right_child():
	return right
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
