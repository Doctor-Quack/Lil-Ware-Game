extends Node2D
@onready var life_container: HBoxContainer = $"life container"
@onready var lilhead: TextureRect = $"life container/lil' head"
@onready var lilhead2: TextureRect = $"life container/lil' head2"
@onready var lilhead3: TextureRect = $"life container/lil' head3"
@onready var lilhead4: TextureRect = $"life container/lil' head4"
@onready var lilhead5: TextureRect = $"life container/lil' head5"
@onready var level_node: RichTextLabel = $"Level_node"
@onready var timer_node: RichTextLabel = $"Timer_node"

var time

func _ready() -> void:
	await get_tree().create_timer(5.0).timeout #uses the function created
	
	if Global.minigames_done < 3: #if you haven't completed 3 minigames
		Global.minigames_done = Global.minigames_done +1
		get_tree().change_scene_to_file("res://Scenes/minigame_" + str(Global.minigames_done) + ".tscn") 
		#changes your scene by arranging this frankenstein path
#the command above changes the minigame based on the levels you complete and completed. 
#whenever a level is passed, it adds one to minigames_done, and looks for the scene for that minigame.
#reminder to name minigame saves properly

	else:
		get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")
func _process(delta : float) -> void

# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.

	pass
