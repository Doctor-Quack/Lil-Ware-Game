extends Node2D

@onready var minigame_timer: Node2D = $"minigame_timer"
var cheese_collected = 0 #checks ofg how many cheese has been taken
var timer_end = false #checks if timer ended
func _ready() -> void:
	await minigame_timer.Timer(10.0) #accessing a function from this node after this is completed
	timer_end = true #if timer finishes
func _process(_delta: float) -> void:
	if cheese_collected == 3: #two equals signs asks if the values are the same
		if Global.minigames_done > 3: #uses the global script to see how many minigames have been done
			get_tree().change_scene_to_file("res://Scenes/done_scene.tscn") #changes screen into a not yet created scene
		else:
			get_tree().change_scene_to_file("res://Scenes/level_scene.tscn") #back to the intermission screen
	if timer_end:
		Global.minigames_done -=1
		Global.lives -= 1 #lose one life
		get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
func cheese_collect() -> void:
	cheese_collected = cheese_collected +1
