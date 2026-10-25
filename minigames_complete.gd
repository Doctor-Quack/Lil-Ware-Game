extends RichTextLabel

@onready var minigames_complete: RichTextLabel = $"minigames_complete"

# Called when the node enters the scene tree for the first time.
func _process(_delta: float) -> void:
	minigames_complete.text = "Levels passed" + str(Global.minigames_done)
