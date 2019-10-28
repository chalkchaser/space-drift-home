extends TileMap

var slime = load("res://entities/Slime.tscn")

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func draw_map(matrix):
	for x in len(matrix):
		for y in len(matrix[x]):
			set_cell(x,y, matrix[x][y])
			if(matrix[x][y] == 2):
				var node = slime.instance()
				node.global_position = (Vector2( x * 16 + 8,y * 16 + 8))
				get_parent().add_child(node)
				