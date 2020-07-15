extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var world_size = Vector2(32, 8)
var matrix = []
var tilemap
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	empty_matrix()
	get_node("TileMapSpaceShip")
	var leaves = get_node("BSPtree").get_leaves()
	for i in leaves:
		print(i.center)
	draw_on_matrix(leaves)	
	#test_print(matrix)
	get_node("TileMapSpaceShip").draw_map(matrix)	

func empty_matrix():
	for x in range(world_size.x+1): #+1 to draw a last wall on the border
			matrix.append([])
			for y in range(world_size.y+1):
				matrix[x].append(0)

func draw_on_matrix(leaf_list):
				for leaf in leaf_list:
					draw_room(leaf)

func draw_room(leaf):

	var size_x = leaf.size.x
	var size_y = leaf.size.y
	
	for x in size_x+1: #+1 because this makes 
		for y in size_y+1: #it possible to draw beyond the world restraints(walls)
			matrix[x-leaf.size.x/2+leaf.center.x][y- leaf.size.y/2+leaf.center.y] = 2
			if x == 0 or x == leaf.size.x:
				matrix[x-leaf.size.x/2+leaf.center.x][y- leaf.size.y/2+leaf.center.y] = 1
			if y == 0 or y == leaf.size.y:
				matrix[x-leaf.size.x/2+leaf.center.x][y- leaf.size.y/2+leaf.center.y] = 1	
		#matrix[leaf.center.x][leaf.center.y] = 0		

func test_print(matrix):
	for row in range(len(matrix)):
		var current_row = ""
		for col in range (len(matrix[row])):
			current_row = current_row + str(matrix[row][col] )+ " "
		print (current_row)
		
