extends Node

onready var button1 = get_parent().get_node("Choice1")
onready var button2 = get_parent().get_node("Choice2")
onready var time_now = get_parent().get_node("reply_timer")
onready var logo = get_parent().get_node("ScrollContainer/VBoxContainer/ItsAMatch")

var press = 0
var stage = 0
var grey
var blue

var traversal = ""

onready var karma = 0

func _ready():
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
	traversal = traversal + "1"
	press = 1
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

func on_pressed2():
	logo.hide()
	traversal = traversal + "2"
	button1.set_disabled(true)
	button2.set_disabled(true)
	var ask = Button.new()
	ask.set_owner(get_tree().get_edited_scene_root())
	ask.set_text(button2.get_text())
	ask.set('custom_styles/normal', blue)
	ask.set_ignore_mouse(true)
	ask.set_anchor(MARGIN_LEFT, 1, false) 
	get_parent().get_node("ScrollContainer/VBoxContainer").add_child(ask)
	time_now.start()
	press = 2
	
func _process(delta):
	#print(traversal)
	print(int(time_now.get_time_left()))
	
	if(int(time_now.get_time_left()) == 1):
		# 1 = left, 2 = right
		if(traversal == "1"):
			karma = karma + 1
			button_relay("Bad, can you make it better?", "How bad? My ability is limited", "I know why it's bad")
		elif(traversal == "2"):
			button_relay("You wot m8?", "Oh, I'm taking a Bio class", "R u a guy?")
		elif(traversal == "11"):
			button_relay("If I have 2 bullets to kill you and Ajit Pai, I shoot you twice", "Wow, that sounds horrible", "Wow, calm your tits")
		elif(traversal == "12"):
			button_relay("What do you know", "Same reasons that make us here", "The reason makes you find sticks on Tinder")
		elif(traversal == "21"):#Bio Class
			button_relay("They teach sex in bio class, that's weird", "Yeah, and I'm a fast learner", "Hell yeah, want to teach u how to do")
		elif(traversal == "22"): #R u a guy
			button_relay("I'm more girly than yo mama", "My appology for being impolite", "Prove it, tell me your name")
		elif(traversal == "111"):#Sound horrible
			button_relay("Can you let me do it?", "Sure, if that makes you feel better", "No, you'll taste my boomstick b4 doing dat")
		elif(traversal == "112"): #calm tits
			button_relay("They're being like diamonds, lad", "^ Perfect women don't exi...", "Let's mine those...")
		elif(traversal == "121"): #reason
			button_relay("What reason", "To be special together", "Meet me and I tell you")
		elif(traversal == "122"):#sticks on tinder
			button_relay("Hey f*** you", "I'm just joking", "Do it IRL!")
		elif(traversal == "211"):#fast learner
			button_relay("Action is always better than theory", "I'm good at acting", "Let me show you my BIG BANG theory")
		elif(traversal == "212"):
			button_relay("212", "2121", "2122")
		elif(traversal == "221"):
			button_relay("221", "2211", "2212")
		elif(traversal == "222"):
			button_relay("222", "2221", "2222")
		elif(traversal == "2122"):
			#true end
			pass
		else:
			pass #bad end

func button_relay(girl_reply, next_choice_1, next_choice_2):
	if (int(time_now.get_time_left()) == 1):
		time_now.stop()
		var reply = Button.new()
		reply.set_owner(get_tree().get_edited_scene_root())
		reply.set_text(girl_reply)
		reply.set("custom_colors/font_color",Color(0,0,0))
		reply.set('custom_styles/normal', grey)
		reply.set_ignore_mouse(true)
		get_parent().get_node("ScrollContainer/VBoxContainer").add_child(reply)
		button1.set_text(next_choice_1)
		button2.set_text(next_choice_2)
		button1.set_disabled(false)
		button2.set_disabled(false)
		stage = stage + 1
		press = 0
