extends Node

onready var button1 = get_parent().get_node("Choice1")
onready var button2 = get_parent().get_node("Choice2")

onready var logo = get_parent().get_node("ScrollContainer/VBoxContainer/ItsAMatch")

onready var c1 = File.new()
onready var c2 = File.new()
var counter = 0
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
	button2.set_text("Can I have your number?")
	pass

func on_pressed1():
	logo.hide()
	
	
	var nextButton = Button.new()
	nextButton.set_owner(get_tree().get_edited_scene_root())
	
	nextButton.set_text("New Button")
	get_parent().get_node("ScrollContainer/VBoxContainer").add_child(nextButton)

func on_pressed2():
	logo.hide()
	print("false")

	button1.set_text("Do you like sexual intercourse?")
	button2.set_text("\n\nI'm sick")
	counter = counter + 1