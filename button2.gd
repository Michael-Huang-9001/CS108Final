extends Button

# class member variables go here, for example:
# var a = 2
var b1
var b2

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	b1 = get_node("Choice1")
	b2 = get_node("Choice2")
	pass

func _on_Button_pressed():
	