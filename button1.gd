extends Node

onready var button1 = get_parent().get_node("Choice1")
onready var button2 = get_parent().get_node("Choice2")
onready var time_now = get_parent().get_node("reply_timer")
onready var logo = get_parent().get_node("ScrollContainer/VBoxContainer/ItsAMatch")

onready var c1 = File.new()
onready var c2 = File.new()
var press = 0
#var press2 = 0
var stage = 0
var grey
var blue

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#textbutton.set_disabled(true)
	
	grey = StyleBoxFlat.new()
	blue = StyleBoxFlat.new()
	grey.set_bg_color(Color("#D3D3D3"))
	blue.set_bg_color(Color("#00BFFF"))
	#button1.set('custom_styles/normal', grey)
	#button2.set('custom_styles/normal', blue)
	button1.connect("pressed", self, "on_pressed1")
	button2.connect("pressed", self, "on_pressed2")
	button1.set_text("Hi, how's your day?")
	button2.set_text("Do you like sexual intercourse?")
	set_process(true)
	
	pass

func on_pressed1():
	logo.hide()
	#press1 = 1 # Button 1 is press, reset to 0 every check
	
	
		
	press = 1;
	
	button1.set_disabled(true)
	button2.set_disabled(true)
	var ask = Button.new()
	ask.set_owner(get_tree().get_edited_scene_root())
	ask.set_text(button1.get_text())
	ask.set('custom_styles/normal', blue)
	ask.set_ignore_mouse(true)
	ask.set_anchor(MARGIN_LEFT, 1, false) 
	get_parent().get_node("ScrollContainer/VBoxContainer").add_child(ask)
		
		
	time_now.start()
	press = 0
		#if(int(time_now.get_time_left()) == 1):			
		#	var reply = Button.new()
		#	reply.set_owner(get_tree().get_edited_scene_root())
		#	reply.set_text("Bad, can you make it better?")
		#	reply.set("custom_colors/font_color",Color(0,0,0))
		#	reply.set('custom_styles/normal', grey)
		#	reply.set_ignore_mouse(true)
		#	get_parent().get_node("ScrollContainer/VBoxContainer").add_child(reply)
		#	
		#	button1.set_text("How bad? My ability is limited")
		#	button2.set_text("I know why")
			

func on_pressed2():
	logo.hide()
	button1.set_disabled(true)
	button2.set_disabled(true)
	#if(stage == 0):
	var ask = Button.new()
	ask.set_owner(get_tree().get_edited_scene_root())
	ask.set_text(button2.get_text())
	ask.set('custom_styles/normal', blue)
	ask.set_ignore_mouse(true)
	ask.set_anchor(MARGIN_LEFT, 1, false) 
	get_parent().get_node("ScrollContainer/VBoxContainer").add_child(ask)
	time_now.start()
	press = 2
		#var reply = Button.new()
		#reply.set_owner(get_tree().get_edited_scene_root())
		#reply.set_text("You wot m8?")
		#reply.set("custom_colors/font_color",Color(0,0,0))
		#reply.set('custom_styles/normal', grey)
		#reply.set_ignore_mouse(true)
		#get_parent().get_node("ScrollContainer/VBoxContainer").add_child(reply)
		
		#button1.set_text("Oh, I'm taking a Bio class")
		#button2.set_text("R u a guy?")
	
func _process(delta):
	print(int(time_now.get_time_left()) )
	
	if(int(time_now.get_time_left()) == 1):
		if(stage == 0 && press == 1):
			var reply = Button.new()
			reply.set_owner(get_tree().get_edited_scene_root())
			reply.set_text("Bad, can you make it better?")
			reply.set("custom_colors/font_color",Color(0,0,0))
			reply.set('custom_styles/normal', grey)
			reply.set_ignore_mouse(true)
			get_parent().get_node("ScrollContainer/VBoxContainer").add_child(reply)
			time_now.stop()
			button1.set_text("How bad? My ability is limited")
			button2.set_text("I know why")
			button1.set_disabled(false)
			stage = stage + 1
			press = 0
			
		if(stage == 0 && press == 2):
			var reply = Button.new()
			reply.set_owner(get_tree().get_edited_scene_root())
			reply.set_text("You wot m8?")
			reply.set("custom_colors/font_color",Color(0,0,0))
			reply.set('custom_styles/normal', grey)
			reply.set_ignore_mouse(true)
			get_parent().get_node("ScrollContainer/VBoxContainer").add_child(reply)
		
			button1.set_text("Oh, I'm taking a Bio class")
			button2.set_text("R u a guy?")
			button1.set_disabled(false)
			button2.set_disabled(false)
			stage = stage + 1
			press = 0
			
		

