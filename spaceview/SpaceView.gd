extends Node2D

var distance = 0
var sceen_width_minus_ship_length = 300
var pixel_speed_per_frame = 0.02
var dict = {}
var ship_y_position = 0
var ship_moves_up = true
var mission_data
var mission_end
var mission_text = ""
var mission_event1
var mission_event2
var mission_event3
var mission_answer_text1 = ""
var mission_answer_text2 = ""
var mission_answer_text3 = ""
var timer
var current_mission_probability = 0.25
var STARTING_MISSION_PROBABILITY = 0.25
var is_end = false
var pause_ship = false


var scroll_offset = Vector2(0,0)
var scroll_offset2 = Vector2(0,0)

func _ready():
	BackgroundMusic.change_to("Grace.ogg")

	
	get_node("ParallaxLayer").scroll_offset = scroll_offset
	get_node("ParallaxLayer2").scroll_offset = scroll_offset2
	get_node("ParallaxLayer/Background/universe").modulate = Color(2, 0 , 4)
	get_node("ParallaxLayer2/Planets/Sprite").modulate = Color(1.2, 1 , 2)
	get_node("PositionOfShip/BigShipSprite").modulate= Color(1.2 , 1 , 2)


	randomize()
	change_and_hide_text_box()
	
	parse_mission_json()
	parse_end_json()
	start_new_mission_timer()

	
func generate_mission_dialogue(mission):
	
	print(mission.MissionName)	
	mission_text = mission.Text
	
	var answers = generate_answers(mission)
	mission_answer_text1 = answers[0].Text
	if(answers.size()>1):
		mission_answer_text2 = answers[1].Text
	else:
		mission_answer_text2 = ""	
	if(answers.size()>2):	
		mission_answer_text3 = answers[2].Text
	else:
		mission_answer_text3 = ""
	if(answers.size()>0 and answers[0].LinksTo != null):	
		mission_event1 = answers[0].LinksTo
	else:
		mission_event1 = ""	
	if(answers.size()>1 and answers[1].LinksTo != null):	
		mission_event2 = answers[1].LinksTo	
	else:
		mission_event2 = ""		
	if(answers.size()>2 and answers[2].LinksTo != null ):	
		mission_event3 = answers[2].LinksTo
	else:
		mission_event3 = ""		
		
		
	for answer in answers:
		print(answer.Text)
		print(answer.LinksTo)
	
func start_new_mission_timer():
	current_mission_probability = STARTING_MISSION_PROBABILITY
	timer = Timer.new()
	timer.wait_time = 4
	timer.one_shot = false
	self.add_child(timer)
	timer.start()
	timer.connect("timeout",self,"mission_tick")
	
	
func mission_tick(): 
	if(randf() < current_mission_probability):
		timer.queue_free()
		var mission = generate_mission()
		generate_mission_dialogue(mission)#these should be called
		generate_answers(mission)
		show_mission()          
		pause_ship = true
		print("mission has been generated with probability: "+str(current_mission_probability))
	else: 
		current_mission_probability = current_mission_probability * 1.5
	print("tick, new mission probability: " + str(current_mission_probability))
	

func parse_mission_json():
	var mission_data_file = File.new()
	mission_data_file.open("res://invisibleData/mission_dialogue.json", File.READ)
	var mission_data_json = JSON.parse(mission_data_file.get_as_text())
	mission_data_file.close()
	mission_data = mission_data_json.result
	
func parse_end_json():
	var mission_end_file = File.new()
	mission_end_file.open("res://invisibleData/mission_end.json", File.READ)
	var mission_end_json = JSON.parse(mission_end_file.get_as_text())
	mission_end_file.close()
	mission_end = mission_end_json.result	

func change_and_hide_text_box():
	get_node("TextDialogue/TextBox").modulate = Color(1, 1, 1, 0.5)
	get_node("TextDialogue").hide()

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
	weighted_missions.shuffle() # Randomizes Missions
	print(weighted_missions[0])
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
	get_node("TextDialogue").show()
	get_node("TextDialogue/MissionTextBox").text = mission_text
	get_node("TextDialogue/Text1").text = mission_answer_text1
	get_node("TextDialogue/Text2").text = mission_answer_text2
	get_node("TextDialogue/Text3").text = mission_answer_text3
	show_answers()
	if mission_answer_text1 == "":
		get_node("TextDialogue/Answer1").hide()#must use autofinish text when answer 1 is empty
	if mission_answer_text2 == "":
		get_node("TextDialogue/Answer2").hide()
	if mission_answer_text3 == "":
		get_node("TextDialogue/Answer3").hide()	
	

func button_on_hover():
	if(get_node("TextDialogue/Answer1").is_hovered()):
		get_node("TextDialogue/Text1").modulate = Color(0.95, 1, 0, 1)
	else: 	
		get_node("TextDialogue/Text1").modulate = Color(1, 1, 1)	
		
	if(get_node("TextDialogue/Answer2").is_hovered()):
		get_node("TextDialogue/Text2").modulate = Color(0.95, 1, 0, 1)
	else: 	
		get_node("TextDialogue/Text2").modulate = Color(1, 1, 1)	
		
	if(get_node("TextDialogue/Answer3").is_hovered()):
		get_node("TextDialogue/Text3").modulate = Color(0.95, 1, 0, 1)
	else: 	
		get_node("TextDialogue/Text3").modulate = Color(1, 1, 1)
		
func _process(delta):
	button_on_hover()
	if(not pause_ship):
		get_node("ParallaxLayer").scroll_offset = scroll_offset
		get_node("ParallaxLayer2").scroll_offset = scroll_offset2
		scroll_offset = scroll_offset + Vector2(- 0.04,0)
		scroll_offset2 = scroll_offset2 + Vector2(-0.06, 0)
		if(scroll_offset.x < -320):
			scroll_offset = Vector2(0,0)
		if(scroll_offset2.x < -320):
			scroll_offset2 = Vector2(0,0)
		if(get_node("Position2D").position.x<sceen_width_minus_ship_length):
			get_node("Position2D").position.x =get_node("Position2D").position.x+ pixel_speed_per_frame
	
		get_node("Position2D/Ship").speed_scale = 1
		get_node("PositionOfShip/BigShipSprite").speed_scale = 1
		if(ship_y_position>6):
			ship_moves_up = false
		if(ship_y_position < -6):
			ship_moves_up = true
		if(ship_moves_up):
			ship_y_position = ship_y_position +0.1
		else: ship_y_position = ship_y_position -0.1
		get_node("PositionOfShip").position.y  = ship_y_position
		
	
	else: #ship is paused
		get_node("PositionOfShip/BigShipSprite").speed_scale = 0
		get_node("Position2D/Ship").speed_scale = 0
		

func _on_Answer1_button_down():
	print("button1 pressed")
	print("event that should be activated is: " + str(mission_event1))

	#var path = "res://stages/" + str(mission_event1)+ ".tscn"
	#get_tree().change_scene(path)
	handle_event(mission_event1)

func _on_Answer2_button_down():
	print("button2 pressed")
	print("event that should be activated is: " + str(mission_event2))
	#var path = "res://stages/" + str(mission_event2)+ ".tscn"
	#get_tree().change_scene(path)
	handle_event(mission_event2)

func _on_Answer3_button_down():
	print("button3 pressed")
	print("event that should be activated is: " + str(mission_event3))
	#var path = "res://stages/" + str(mission_event3)+ ".tscn"
	#get_tree().change_scene(path)
	handle_event(mission_event3)


var end_to_be_handled = ""
func handle_event(mission_event):
	for id in mission_end:
		if str(id) == mission_event:
			get_node("TextDialogue/MissionTextBox").text = mission_end[id].Text
			hide_answers()
			is_end = true
			end_to_be_handled = mission_end[id].Event
			
#this is the real event handler
func _on_ClickAll_button_down():
	if(is_end == true):
		is_end = false
		get_node("TextDialogue").hide()	
		pause_ship = false
		if(end_to_be_handled == null):
			print("nothing to be handled")
		else:		
			print(end_to_be_handled)
			if(end_to_be_handled.begins_with("stage ")):
				MetaLogic.switch_to_stage(end_to_be_handled)
				
			if(end_to_be_handled.begins_with("item ")): 
				item_event_process(str(end_to_be_handled.lstrip("item ")))		
		start_new_mission_timer()

	#mission_event is of type String
	
#takes a string and calls and proceeds to turn it into a item result
func item_event_process(item):#type string	
	if item.begins_with("reduce_life"):
		Interface.health = Interface.health - 20
		Interface.get_node("TextureProgress")._set_value(Interface.health)	#deferred call

		#get_node.Interface.
		#pass
	
func hide_answers():
	get_node("TextDialogue/Answer1").hide()		
	get_node("TextDialogue/Answer2").hide()	
	get_node("TextDialogue/Answer3").hide()	
	get_node("TextDialogue/Text1").hide()
	get_node("TextDialogue/Text2").hide()
	get_node("TextDialogue/Text3").hide()

func show_answers():
	get_node("TextDialogue/Answer1").show()		
	get_node("TextDialogue/Answer2").show()	
	get_node("TextDialogue/Answer3").show()	
	get_node("TextDialogue/Text1").show()
	get_node("TextDialogue/Text2").show()
	get_node("TextDialogue/Text3").show()	
	
# ? types of events
# type of Answer Dialgoue => Answer Dialogue| null  
# 0: "do_nothing" -> Answer Dialgogue -> (change (variables| items))optional #dialogue A -> dialogue R -> dialogue epsilon
# 1: "stage_change" -> Answer Dialogue -> change_stage #dialogue A -> dialogue R -> dialogue stage_change
# 2: "jump_to_mission"-> event # dialogue A -> dialogue Event -> dialogue  dialogue A ...
# 3: "buffer" -> "answer dialogue -> (change (variables| items))optional -> event dialogue Event -> dialogue itemchange dialogue A ...

# sigma{ Event ,dialogue, A,  E)
# dialogue Event -> (itemchange) dialogue Event | End
# End -> dialogue stage_change|item_change| epsilon

# TODO
# necessary functions
# Event <- generate_mission_dialoge,item_change # called sich selbst aus dem JSONfile1, beinhalted dialogue
# End <- stage_change(),item_change(), close_dialogue() # called by JSONfile2


