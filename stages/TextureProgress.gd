extends TextureProgress

# Called when the node enters the scene tree for the first time.

func _ready():
	tint_progress = (Color(0,1,0,1))
		
func _set_value(health):
	value = health
	if(value < max_value/2):
		tint_progress = Color(1, 1,0,1)
	if(value < max_value/4):
		tint_progress = (Color(1,0,0,1))
	rect_scale = Vector2(1.05,1.08)
	
func _process(delta):
	rect_scale = rect_scale.linear_interpolate(Vector2(1,1),0.2)

	#self.texture_progress = bar