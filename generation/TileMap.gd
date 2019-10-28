extends TileMap

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func draw_map(matrix):
	for x in len(matrix):
		for y in len(matrix[x]):
			set_cell(x,y, matrix[x][y])