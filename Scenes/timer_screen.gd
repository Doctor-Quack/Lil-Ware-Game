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
	await Timer(5.0) #uses the function created
	
	if Global.minigames_done < 3: #if you haven't completed 3 minigames
		Global.minigames_done = Global.minigames_done +1
		get_tree().change_scene_to_file("res://Scenes/minigame_" + str(Global.minigames_done) + ".tscn") 
		#changes your scene by arranging this frankenstein path
#the command above changes the minigame based on the levels you complete and completed. 
#whenever a level is passed, it adds one to minigames_done, and looks for the scene for that minigame.
#reminder to name minigame saves properly

	else:
		get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")


func _process(_delta: float) -> void:
	match Global.lives: 
		#asks or checks if lives is equal to one of these values, but is not very good looking
		4:
			lilhead.hide()
		3:
			lilhead.hide()
			lilhead2.hide()
		2:
			lilhead.hide()
			lilhead2.hide()
			lilhead3.hide()
		1:
			lilhead.hide()
			lilhead2.hide()
			lilhead3.hide()
			lilhead4.hide()
		0:
			life_container.hide() #removes all lives from screen
	timer_node.text = str(time) #this shows the int of the time variable as a string
	level_node.text = "Level" + str(Global.minigames_done) #this shows you what minigame is being played using concatenation
func Timer(start_time: float): #makes a new function for the countdown
	time = start_time #make the timer, which is reflected through the timer text, start at your desired number
	while time > 0.0: #run if timer hasn't reached 0
		#when the timer hits 0, it should change scenes
		await wait(0.1) #asks scripts to wait on this function. the 'wait' name for the function does nothing here, as await is just telling the script to wait for th function to complete before progressing
		time -= 0.1 #removes 0.1 from time variable
	return

func wait(seconds: float) -> void: #this simple function is for wait
	await get_tree().create_timer(seconds).timeout #makes you wait
	
