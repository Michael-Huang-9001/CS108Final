extends Node

onready var button1 = get_parent().get_node("Choice1")
onready var button2 = get_parent().get_node("Choice2")
onready var text = get_parent().get_node("ScrollContainer/VBoxContainer/PanelContainer/Label")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	button1.connect("pressed", self, "on_pressed1")
	button2.connect("pressed", self, "on_pressed2")
	button1.set_text("Hi, how's your day?")
	button2.set_text("Can I have your number?")
	pass

func on_pressed1():
	print("true")

func on_pressed2():
	print("false")