extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var laughVid = preload("res://Vids/Hello.ogv")
var isPlay = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	
	pass
func _process(delta):
	if(!get_node("hello").is_playing()):
		get_node("hello").play()
		isPlay = isPlay + 1
		if(isPlay == 1):
			get_node("hello").stop()
