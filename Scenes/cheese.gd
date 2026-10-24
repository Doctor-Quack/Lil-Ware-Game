extends Node2D
@onready var player: CharacterBody2D = $"../Player"
@onready var self_area: = $Area2D
@onready var player_area: = $"../Player/Area2D"

signal cheese_collected

func _process(delta: float) -> void:
	if player_area.overlaps_area(self_area): #checks if the cheese is overlapping with the player
		if self.visible:
			emit_signal("garlic_collected") #signals broadcast
			self.hide() #dissapears, looking like it was collected
