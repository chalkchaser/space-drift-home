extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _is_hit():
	print("slender alien has been hit")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(get_node("AnimatedSprite").frame == 12):
		attack()


onready var projectile = load("res://entities/slender_anim_attack.tscn")

func attack():
	var stage = get_tree().current_scene
	var attack_projectile = projectile.instance()
	var off_set_distance = Vector2(randf()/2,0)
	off_set_distance = off_set_distance.rotated(rand_range(0,6.28))
	var vector_to_player = ((get_parent().get_node("Player").get_node("Shadow").get_global_position() - self.get_global_position()  ))
	attack_projectile.move = vector_to_player.normalized()
	attack_projectile.move = attack_projectile.move + off_set_distance
	stage.add_child(attack_projectile)
	print("added")
	attack_projectile.position = get_parent().get_node("SlenderAlien").position + Vector2(10,0)
