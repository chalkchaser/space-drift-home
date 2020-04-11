extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var distance = 0
var sceen_width_minus_ship_length = 300
var pixel_speed_per_frame = 0.04
var dict = {}
# Called when the node enters the scene tree for the first time.
var mission_data
func _ready():
	var mission_data_file = File.new()
	mission_data_file.open("res://invisibleData/mission_dialogue.json", File.READ)
	var mission_data_json = JSON.parse(mission_data_file.get_as_text())
	mission_data_file.close()
	mission_data = mission_data_json.result
	
	randomize()
	var mission = generate_mission()
	print(mission.MissionName)	
	var answers = generate_answers(mission)
	for answer in answers:
		print(answer.Text)
	
	show_mission()
	#get_node("RichTextLabel").set_text(str(dict[1]))


func generate_mission():
	var possible_missions = []
	var temp_missions = []
	var weighted_missions = []
	for id in mission_data:
		if(  int(id) % 10 == 0):
				possible_missions.append(mission_data[id])
	for i in possible_missions:
			temp_missions.append([i,i.Weight])
	for i in temp_missions:
		while i[1] > 0: #i[1] is the weight of the mission name
			weighted_missions.append(i[0]) #generates a list of mission names
			i[1] = i[1] -1 	
	weighted_missions.shuffle()		
	return weighted_missions[0]
	#for i in possible_missions:
	
func generate_answers(mission):
	var answers = []
	var generated_answers = []
	for i in range(mission.MissionID+1,mission.MissionID+10,1):
			answers.append(i)
	for id in mission_data:	
		for i in answers:
			if id == str(i):
				generated_answers.append(mission_data[id])
		
	return generated_answers
		
		
	
	
func show_mission():	
	pass

func _process(delta):
	if(get_node("Position2D").position.x<sceen_width_minus_ship_length):
		get_node("Position2D").position.x =get_node("Position2D").position.x+ pixel_speed_per_frame




