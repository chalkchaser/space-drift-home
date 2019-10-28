extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var world_size = 128
var matrix = []
var born_alive_chance = 0.55
var death_limit = 3
var birth_limit = 4
var tilemap 


# Called when the node enters the scene tree for the first time.
func _ready():
	tilemap = get_node("TileMap")
	
	randomize()
	empty_matrix()
	_set_random_alive(matrix)	
	_do_simulation_step(matrix)

	matrix = _do_simulation_step(matrix)
	matrix = _do_simulation_step(matrix)
	matrix = _do_simulation_step(matrix)
	#test_print(matrix)
	_flood_fill(matrix,1,8)
	test_print(matrix)
	set_enemy(matrix)
	tilemap.draw_map(matrix)

func empty_matrix():
	for x in range(world_size):
			matrix.append([])
			for y in range(world_size):
	        matrix[x].append(0)

func test_print(matrix):
	for row in range(len(matrix)):
		var current_row = ""
		for col in range (len(matrix[row])):
			current_row = current_row + str(matrix[row][col] )+ " "
		print (current_row)
		
func _set_random_alive(matrix):
		for row in range(len(matrix)):
			for col in range (len(matrix[row])):
				if(randf()<born_alive_chance):
					matrix[row][col] = 1
					
func _do_simulation_step(oldmatrix): #maybe should use sideeffect
	var new_matrix = []
	for x in range(world_size):
		new_matrix.append([])
		for y in range(world_size):
        new_matrix[x].append(0)
		
	for x in range(len(oldmatrix)):
		for y in range (len(matrix[x])):
			if(matrix[x][y] == 1): # if the cell is alive
				if(_count_alive_neighbours(matrix,x,y)< death_limit): # if there are too few neighbours
					new_matrix[x][y] = 0
				else:
					new_matrix[x][y] = 1
			else: # if the cell is dead already
				if(_count_alive_neighbours(matrix,x,y)> birth_limit):
					new_matrix[x][y] = 1
				else:
					new_matrix[x][y] = 0
	return new_matrix						
	
func _flood_fill(matrix, former, latter):
	var first_x 
	var first_y	#gets one cell for former
	for x in range(len(matrix)):
		for y in range (len(matrix[x])):	
			if(matrix[x][y] == former):
				print ("x :" + str(x) + " y:" + str(y)) 
				break
		 else:
        # Continue if the inner loop wasn't broken.
        continue
    # Inner loop was broken, break the outer.
		break	


func binary_partition_cut_horizontally(matrix,origin_x, origin_y, steps ):
	var width = len(matrix)
	var height = len(matrix[0])
	var lower_bound = 0.2 # gauss?
	var upper_bound = 0.8
	var cutting_point
	var matrix_list = []
	var rng = RandomNumberGenerator.new()
	var cutter =  int(rng.randf_range( lower_bound, upper_bound ) * width)
	var temp_matrix_1 = []
	var temp_matrix_2 = []
	
	for x in range(0,cutter): #cuts horizontally
		temp_matrix_1.append(matrix[x])
	for x in range(cutter, len(matrix)):
		temp_matrix_2.append(matrix[x])
	matrix_list.append( [temp_matrix_1, origin_x, origin_y])
	matrix_list.append( [temp_matrix_2, cutter, origin_y]) 
	return matrix_list
	
func binary_partition_cut_vertically(matrix,origin_x, origin_y, steps ):	
	var width = len(matrix)
	var height = len(matrix[0])
	var lower_bound = 0.2 # gauss?
	var upper_bound = 0.8
	var cutting_point
	var matrix_list = []
	var rng = RandomNumberGenerator.new()
	var cutter =  int(rng.randf_range( lower_bound, upper_bound ) * height)
	var temp_matrix_1 = []
	var temp_matrix_2 = []
	
	for x in range(0, width):
		temp_matrix_1.append([])
		temp_matrix_2.append([])
		for y in range(0,cutter):
			temp_matrix_1[x].append(matrix[x][y])
		for y in range(cutter, height):
			temp_matrix_2[x].append(matrix[x][y])
	matrix_list.append( [temp_matrix_1, origin_x, origin_y])
	matrix_list.append( [temp_matrix_2, cutter, origin_y]) 
	return matrix_list		
			
	
	
func _count_alive_neighbours(matrix,x,y):
	var count = 0 # TODO negate counting self
	for j in[y-1, y, y+1]:
		for i in [x-1, x, x+1]:
			if(j< world_size-1  and x <world_size - 1):
				if(matrix[i][j] > 0 ):
					if !(i== x and j == y):
						count = count +1		
	return count	
func set_enemy(matrix):
	for x in range(len(matrix)):
		for y in range(len(matrix[x])):
			if(matrix[x][y] == 1):
				if(randf()< 0.01):
					matrix[x][y] = 2
					
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
