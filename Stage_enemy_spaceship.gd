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
	test_print(matrix)
	get_node("TileMapSpaceShip").draw_map(matrix)	

func empty_matrix():
	for x in range(world_size.x):
			matrix.append([])
			for y in range(world_size.y):
				matrix[x].append(0)

func draw_on_matrix(vector2_list):
	for x in range(world_size.x):
			for y in range(world_size.y):
				for i in vector2_list:
					if(i.center.x == x and i.center.y == y):
						matrix[x][y]=1
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func test_print(matrix):
	for row in range(len(matrix)):
		var current_row = ""
		for col in range (len(matrix[row])):
			current_row = current_row + str(matrix[row][col] )+ " "
		print (current_row)
		
