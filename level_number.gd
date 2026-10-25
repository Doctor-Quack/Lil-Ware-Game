extends RichTextLabel

@onready var level_number: RichTextLabel = $"level_number"

# Called when the node enters the scene tree for the first time.
func _process(_delta: float) -> void:
	level_number.text = "Next Level is" + str(Global.minigames_done +1)
