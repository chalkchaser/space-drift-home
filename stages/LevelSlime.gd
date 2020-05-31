extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var audio_file = "res://music/'Staircase' Retro Synthwave No Copyright Music.ogg"
	if File.new().file_exists(audio_file):
		var sfx = load(audio_file) 
		BackgroundMusic.stream = sfx
		BackgroundMusic.play()
		BackgroundMusic.volume.interpolate_property(BackgroundMusic,"volume_db",-40, -20,1.2,Tween.TRANS_SINE,Tween.EASE_IN)
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
