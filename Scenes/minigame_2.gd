extends Node2D
@onready var minigame_timer: Node2D = $minigame_timer
var buttons_pressed := 0
var timer_end = false
func _ready() -> void:
	await minigame_timer.Timer(7.0)
	timer_end = true
func _process(delta: float) -> void:
	if buttons_pressed == 5:
		get_tree().change_scene_to_file("res://Scenes/done_screen.tscn")
	else:
		get_tree().change_scene_to_file("res://Scenes/level_scene")
	if timer_end:
		Global.lives -= 1
		Global.minigames_done -=1
		get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
