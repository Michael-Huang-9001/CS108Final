extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var scriptToUse = randi() % 3
var file = File.new()
if file.open("Script1.txt", File.READ) != 0:
	print("Cannot open file")
	return


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	get_tree().change_scene("res://gamearea.tscn")
