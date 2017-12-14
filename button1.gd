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
			button_relay("What reason", "To be special together", "Meet me and I'll tell you")
		elif(traversal == "122"):#sticks on tinder
			button_relay("Hey f*** you", "I'm just joking", "Do it IRL!")
		elif(traversal == "211"):#fast learner
			button_relay("Action is always better than theory", "I'm good at acting", "Let me show you my BIG BANG theory")
		elif(traversal == "212"):#want me to teach
			button_relay("Yes master", "Good, use my affiliate link to buy the text book on Amazon for $69", "It needs at least 2 hours for me to teach you")
		elif(traversal == "221"):#being impolite
			button_relay("Sure", "Please accept, I'll make up for it", "Yeah, you better be")
		elif(traversal == "222"): #tell me your name
			button_relay("Jaimie Megan, is that girly nough", "Wow, cute name <3", "Sounds similar to my college professor's name")
		#-------------------------------------4th stage
		elif(traversal == "1111"): #Sure, if that makes you feel better
			button_relay("Wow, that's really nice of you, let's meet up", "Yay, my address is", "Yeah, it's ur turn to make me")
		elif(traversal == "1112"): #No, you'll taste my boomstick b4 doing dat
			button_relay("Meet me and I'll do it", "Sound great, I'll see you at ***", "Time to test our guns, meet me")
		elif(traversal == "1121"):#^ Perfect women don't exi...
			button_relay("I can show you my perfectness", "I'd love to see. Meet me at ***", "That's what you should say to me. Let's meet")
		elif(traversal == "1122"):#Let's mine those...
			button_relay("If you are brave enough to go deep, do it", "I'm a brave man. Let me show yew", "High risk, high reward, I'm coming")
		elif(traversal == "1211"):#To be special together
			button_relay("You're romantic, I think I like you", "You're special, see me at ***", "I'll have special treatment for you")
		elif(traversal == "1212"):#Meet me and I'll tell you
			button_relay("I would love to hear", "Meet me, I'll tell you", "Meet me, stretch your ears, I'll scream at them")
		elif(traversal == "1221"):#I'm just joking
			button_relay("Bye kid!", "Wait, don't leave me :'(", "You too, beach")
		elif(traversal == "1222"):#Do it IRL!
			button_relay("Tell me the place, I'll do it", "Meet me at ***, I'm waiting", "SJSU, where I am get f*** everyday")
		elif(traversal == "2111"):#I'm good at acting
			button_relay("I'm good at judging", "I'll act for you, meet me", "I'll get 420/69 from you, see me")
		elif(traversal == "2112"):#Let me show you my BIG BANG theory
			button_relay("You mean SMALL BANG theory", "I can re-prove my theory for you, meet me", "For you, every theories becomes LOOSE BANG. Meet me")
		elif(traversal == "2121"):#Good, use my affiliate link to buy the text book on Amazon for $69
			button_relay("Good bye, nerd", "Wait, don't leave", "Wait, you can get the discount for using my link")
		elif(traversal == "2122"):#It needs at least 2 hours for me to teach you
			button_relay("I am willing to learn, master", "Good girl, meet me at ***", "I will transfer my 'knaledge' to you if you meet me")
		elif(traversal == "2211"):#Please accept, I'll make up for it
			button_relay("Make up for me at ***, i'll wait", "I'll see you there", "Hehe, I'll make you up")
		elif(traversal == "2212"):#Yeah, you better be
			button_relay("F*** off", "Wait, no, my mistake, not yours", "Don't be triggered")
		elif(traversal == "2221"):#Wow, cute name <3
			button_relay("I'm cuter in real life", "I would love to observe, can I come and pick you up", "It's easier to say, meet me at ***")
		elif(traversal == "2222"):#Sounds similar to my college professor's name
			button_relay("May be I am, you never know", "If you are, meet me at SJSU Art Building", "You have to see me and make up for my horrible experience")
		else:
			#bad end
			pass
		

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
